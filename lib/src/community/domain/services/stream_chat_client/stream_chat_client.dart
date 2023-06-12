// Dart imports:
// Package imports:
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// Project imports:
import 'package:solid_social/constants/firebase_cloud_functions.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:synchronized/synchronized.dart';

abstract class ChatClient {
  ChatClient(this.client);
  StreamChatClient client;
  Future<OwnUser?> connectUser({
    required String userId,
    required String firstName,
    required String lastName,
  });
  Channel generateChannelForGroup({required DiscussionGroup group});
  Future<void> disconnectUser();
}

class IChatClient extends ChatClient {
  IChatClient(super.client);

  final _fcm = FirebaseMessaging.instance;

  final Lock _lock = Lock();

  final HttpsCallable Function(String, {HttpsCallableOptions? options}) _cloudFunctions =
      FirebaseFunctions.instanceFor(region: 'asia-south1').httpsCallable;

  @override
  Future<OwnUser?> connectUser({
    required String userId,
    required String firstName,
    required String lastName,
  }) async {
    try {
      // Synchronizes the whole process into a one locked async call.
      return await _lock.synchronized<OwnUser?>(() async {
        // http callable cloud function that uses stream chat's [upsertUser] functions to add user to
        // stream chat api.

        if (client.state.currentUser != null) {
          return client.state.currentUser;
        }
        final addUserToStreamchat = _cloudFunctions(CloudFunctions.addUserToStreamchat);

        // cloud call sending parameters to cloud function about current users params to store in streamchat
        final HttpsCallableResult<Map<String, dynamic>> addUserToStreamchatResponse =
            await addUserToStreamchat.call({"userId": userId, "firstName": firstName, "lastName": lastName});
        if (addUserToStreamchatResponse.data["statusCode"] == 200) {
          // Once successfully upserted the users, it is time to generate the auth token to authenticate
          // the current user in client side Stream API.
          final generateStreamchatToken = _cloudFunctions(CloudFunctions.generateStreamchatToken);
          final HttpsCallableResult<Map<String, dynamic>> tokenResponse = await generateStreamchatToken.call();

          if (tokenResponse.data["statusCode"] == 200) {
            // JWT Token from Streamchat
            final token = tokenResponse.data["token"];

            // Connects the user to Stream API Client.
            final connectedUser = await client.connectUser(User(id: userId, name: '$firstName $lastName'), token);

            // Generates Firebase Cloud Messaging token to send notifications to device.
            final fcmToken = await _fcm.getToken();

            // Stream API stores the device's token to send automated push notifications.
            // await client.addDevice(fcmToken ?? "", PushProvider.firebase);

            return connectedUser;
          }
        }
        return null;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Channel generateChannelForGroup({required DiscussionGroup group}) {
    final Channel channel = client.channel("messaging", id: group.id, extraData: group.toStreamchatJson());

    return channel;
  }

  @override
  Future<void> disconnectUser() async {
    await client.disconnectUser();
  }
}
