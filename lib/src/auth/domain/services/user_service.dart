// Dart imports:
import 'dart:io';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Project imports:
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user_dto.dart';
import 'package:solid_social/src/auth/domain/repository/user_repo.dart';

abstract class UserService {
  Future<SolidSocialUser> getCurrentUser();
  Future<SolidSocialUser> getUserById({required String userId});
  Future<List<SolidSocialUser>> getListOfUsersByIds({required List<String> userIds});
  Future<SolidSocialUser> updateUser({required SolidSocialUserDTO dto});
  Future<SolidSocialUser> registerUser({required SolidSocialUser user});
  Future<SolidSocialUser> changeUserDetails(
    SolidSocialUser currentUser, {
    File? bannerFile,
    File? photoFile,
    String? bio,
  });
}

class IUserService implements UserService {
  final UserRepo _repo = IUserRepo();

  IUserService(this.services);

  final Bootstrap services;

  @override
  Future<SolidSocialUser> getCurrentUser() async {
    try {
      final data = await _repo.getCurrentUser();
      final currentUser = SolidSocialUser.fromJson(data);

      return currentUser;
    } on FirebaseException catch (e, s) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SolidSocialUser>> getListOfUsersByIds({required List<String> userIds}) async {
    try {
      final List<Map<String, dynamic>> data = await _repo.getListOfUsersByIds(userIds: userIds);
      return data.map((e) => SolidSocialUser.fromJson(e)).toList();
    } on DBException {
      rethrow;
    }
  }

  @override
  Future<SolidSocialUser> getUserById({required String userId}) async {
    try {
      final data = await _repo.getUserById(userId: userId);

      return SolidSocialUser.fromJson(data);
    } on FirebaseException catch (e, s) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SolidSocialUser> updateUser({required SolidSocialUserDTO dto}) async {
    return SolidSocialUser.fromJson(await _repo.updateUser(dto: dto));
  }

  @override
  Future<SolidSocialUser> registerUser({required SolidSocialUser user}) async {
    return SolidSocialUser.fromJson(await _repo.registerUser(user: user));
  }

  @override
  Future<SolidSocialUser> changeUserDetails(SolidSocialUser currentUser,
      {File? bannerFile, File? photoFile, String? bio}) async {
    try {
      final data = await _repo.changeUserDetails(currentUser, bannerFile: bannerFile, photoFile: photoFile, bio: bio);

      return SolidSocialUser.fromJson(data);
    } on DBException {
      rethrow;
    }
  }
}
