import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/shared/entities/emoji/emoji.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/home/domain/services/states/timeline_data_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class TimelineController extends BootstrapController {
  TimelineController(super.services, {required this.selectedCommunity}) {
    _initialize();
  }
  final Community selectedCommunity;

  TimelineDataState _state = const TimelineDataState.idle();
  set state(TimelineDataState state) {
    _state = state;
    notifyListeners();
  }

  StreamSubscription? _channelSubscription;

  TimelineDataState get state => _state;
  Loading _storiesState = Loading.idle;
  Loading get storiesState => _storiesState;
  set storiesState(Loading state) {
    _storiesState = state;
    notifyListeners();
  }

  late Channel _currentChannel;
  Channel get currentChannel => _currentChannel;

  Future<void> _initialize() async {
    assembleChannelForTimeline();
  }

  Future<void> assembleChannelForTimeline() async {
    _currentChannel = services.chatClient.client.channel("team", id: selectedCommunity.id);

    state = TimelineDataState.assembledChannel(_currentChannel);
    // listenToChannel(_currentChannel);
  }

  Future<void> listenToChannel(Channel channel) async {
    _channelSubscription = channel.on(EventType.messageNew).listen((event) {
      final message = event.message!;
      if (message.extraData["postType"] == PostType.story.name) {
        userStories[message.user!.id] =
            UserStory(user: message.user!, stories: [...?userStories[message.user!.id]?.stories, message]);
        notifyListeners();
      }
      // getUpdatedMessages();
      // state = const TimelineDataState.loaded();
    });
  }

  List<GetMessageResponse> _storiesResponse = [];
  List<GetMessageResponse> get storiesResponse => _storiesResponse;
  set storiesResponse(List<GetMessageResponse> response) {
    _storiesResponse = response;
    notifyListeners();
  }

  Map<String, UserStory> userStories = {};

  Future<void> fetchStories() async {
    storiesState = Loading.processing;
    final messagesResponse = await currentChannel.search(messageFilters: Filter.equal("postType", PostType.story.name));
    storiesResponse = messagesResponse.results;

    final users = storiesResponse.map((e) => e.message.user!).toList();
    final messages = storiesResponse.map((e) => e.message).toList();
    for (final user in users) {
      userStories[user.id] = UserStory(
        user: user,
        stories: messages.where((element) => element.user!.id == user.id).toList(),
      );
    }
    storiesState = Loading.loaded;
  }

  Future<void> sendMessage({
    required String body,
    required PostType type,
    File? attachment,
    Function(DBException)? onError,
    Function(Message)? onMessageSent,
  }) async {
    try {
      if (attachment != null) {
        final response = await _currentChannel.sendMessage(
          Message(text: body, attachments: [
            Attachment(
              type: "image",
              file: AttachmentFile(
                size: await attachment.length(),
                path: attachment.path,
              ),
            ),
          ], extraData: {
            "postType": type.name
          }),
        );
        log("Successfully uploaded post: $response -- Type: $type");
        onMessageSent?.call(response.message);
        return;
      }
      final response = await _currentChannel.sendMessage(
        Message(
          text: body,
          extraData: {"postType": type.name},
        ),
      );
      log("Successfully uploaded post: $response -- Type: $type");
      onMessageSent?.call(response.message);
    } catch (e) {
      onError?.call(const DBException.error("Unable to send this message. Please try again later!."));
    }
  }

  Future<void> addReaction(Message message, Emoji emoji) async {
    final response = await _currentChannel.sendReaction(message, emoji.code, extraData: {"emoji": emoji.emoji});
    log("RESPONSE: $response");
  }

  @override
  void dispose() {
    _channelSubscription?.cancel();
    _currentChannel.stopWatching();
    super.dispose();
  }
}

enum PostType { post, story, comment }

class UserStory {
  final User user;
  final List<Message> stories;

  UserStory({required this.user, required this.stories});
}
