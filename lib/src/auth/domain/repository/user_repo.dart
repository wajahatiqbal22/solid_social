// Dart imports:
import 'dart:developer';
import 'dart:io';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
// Project imports:
import 'package:solid_social/constants/auth_exception_messages.dart';
import 'package:solid_social/exceptions/auth_exception/auth_exception.dart';
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user_dto.dart';

abstract class UserRepo {
  Future<Map<String, dynamic>> getCurrentUser();
  Future<Map<String, dynamic>> getUserById({required String userId});
  Future<List<Map<String, dynamic>>> getListOfUsersByIds({required List<String> userIds});
  Future<Map<String, dynamic>> updateUser({required SolidSocialUserDTO dto});
  Future<Map<String, dynamic>> registerUser({required SolidSocialUser user});

  Future<Map<String, dynamic>> changeUserDetails(SolidSocialUser currentUser,
      {File? bannerFile, File? photoFile, String? bio});
}

class IUserRepo implements UserRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference<SolidSocialUser> get _usersRef =>
      _firestore.collection('users').withConverter<SolidSocialUser>(fromFirestore: (snapshot, _) {
        return SolidSocialUser.fromJson(snapshot.data()!);
      }, toFirestore: (SolidSocialUser user, _) {
        return {};
      });
  DocumentReference<SolidSocialUser> _userDocRef(String id) =>
      _firestore.collection('users').doc(id).withConverter<SolidSocialUser>(fromFirestore: (snapshot, _) {
        return SolidSocialUser.fromJson(snapshot.data()!);
      }, toFirestore: (SolidSocialUser user, _) {
        return {};
      });

  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<Map<String, dynamic>> getCurrentUser() async {
    final currentUser = _firebaseAuth.currentUser;

    try {
      final doc = await _firestore.collection('users').doc(currentUser!.uid).get();
      if (doc.exists) {
        _usersRef.doc(currentUser.uid).update({"fcmToken": await _fcm.getToken()});
        return doc.data()!;
      } else {
        throw const AuthException.userNotFound(kUserNotFoundExceptionMessage);
      }
    } on FirebaseException catch (e, s) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getListOfUsersByIds({required List<String> userIds}) async {
    try {
      if (userIds.isEmpty) {
        throw const DBException.error(kSomethingWentWrongExceptionMessage, "empty");
      }
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection("users").where(FieldPath.documentId, whereIn: userIds).get();
      final List<Map<String, dynamic>> data = snapshot.docs.map((e) => e.data()).toList();
      return data;
    } on FirebaseException catch (e, s) {
      log("EXCEPTION: $e");
      throw DBException.error(e.message, e.code);
    } on DBException {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getUserById({required String userId}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore.collection("users").doc(userId).get();

      if (snapshot.data() == null) throw const AuthException.docDoesNotExist();
      return snapshot.data()!;
    } on FirebaseException catch (e, s) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateUser({required SolidSocialUserDTO dto}) async {
    final data = await _firestore.collection("users").doc(dto.uid).update(dto.toJson());
    return dto.toJson();
  }

  @override
  Future<Map<String, dynamic>> registerUser({required SolidSocialUser user}) async {
    final snapshot = await _firestore.collection("users").doc(currentUser?.uid).get();

    if (snapshot.data() == null) {
      user = user.copyWith(uid: currentUser!.uid);
      await _firestore.collection("users").doc(user.uid).set(user.toJson());
      return user.toJson();
    } else {
      return snapshot.data()!;
    }
  }

  Future<String?> _uploadPhoto(Reference ref, File? file) async {
    try {
      if (file == null) return null;
      final snapshot = await ref.putFile(file);
      return snapshot.ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>> changeUserDetails(SolidSocialUser currentUser,
      {File? bannerFile, File? photoFile, String? bio}) async {
    try {
      final userProfileRef =
          _storage.ref("${_firebaseAuth.currentUser!.uid}/${"profile_" + _firebaseAuth.currentUser!.uid}");
      final profileUrl = await _uploadPhoto(userProfileRef, photoFile);
      final userBannerRef =
          _storage.ref("${_firebaseAuth.currentUser!.uid}/${"banner_" + _firebaseAuth.currentUser!.uid}");
      final bannerUrl = await _uploadPhoto(userBannerRef, bannerFile);

      final userDetails = UserDetails(profileUrl: profileUrl, bannerUrl: bannerUrl, bio: bio);
      if (userDetails.bannerUrl != null) {
        currentUser =
            currentUser.copyWith(userDetails: currentUser.userDetails.copyWith(bannerUrl: userDetails.bannerUrl));
      }
      if (userDetails.profileUrl != null) {
        currentUser =
            currentUser.copyWith(userDetails: currentUser.userDetails.copyWith(profileUrl: userDetails.profileUrl));
      }
      if (bio != null) {
        currentUser = currentUser.copyWith(userDetails: currentUser.userDetails.copyWith(bio: bio));
      }

      await _usersRef.doc(_firebaseAuth.currentUser!.uid).update(currentUser.toJson());
      return currentUser.toJson();
    } on FirebaseException catch (e) {
      throw DBException.error(e.message, e.code);
    }
  }
}
