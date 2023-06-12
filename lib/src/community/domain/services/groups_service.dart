// Dart imports:
import 'dart:io';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/shared/utility/utility_service.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/community/domain/entities/community_metadata/community_metadata.dart';
import 'package:solid_social/src/community/domain/repo/community_repo.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group_dto.dart';

abstract class GroupsService {
  Future<DiscussionGroup> createDiscussionGroup({
    required DiscussionGroup group,
    required List<String> memberIds,
    File? photoFile,
    File? bannerFile,
  });

  Future<DiscussionGroup> updateGroup({required DiscussionGroupDTO groupDTO});

  Future<List<SolidSocialUser>> getCommunityMembers({required String communityId});

  Future<List<DiscussionGroup>> getCommunityGroups({required String communityId});

  String generateDocumentId();
}

class IGroupsService implements GroupsService {
  IGroupsService(this.services);

  final Bootstrap services;
  // final  ChatClient client;
  final CommunityRepo _repo = ICommunityRepo();
  // final UserService _usersService = IUserService(client);
  @override
  Future<DiscussionGroup> createDiscussionGroup({
    required DiscussionGroup group,
    required List<String> memberIds,
    File? photoFile,
    File? bannerFile,
  }) async {
    try {
      group = DiscussionGroup.fromJson(
          await _repo.createDiscussionGroup(group, photoFile: photoFile, bannerFile: bannerFile, memberIds: memberIds));
      return group;
    } on DBException catch (e) {
      rethrow;
    }
  }

  @override
  Future<DiscussionGroup> updateGroup({required DiscussionGroupDTO groupDTO}) async {
    try {
      final data = await _repo.updateGroup(groupDTO: groupDTO);

      return DiscussionGroup.fromJson(data);
    } on FirebaseException catch (e, s) {
      throw DBException.error(e.message, e.code);
    } on DBException catch (e, s) {
      rethrow;
    }
  }

  @override
  Future<List<SolidSocialUser>> getCommunityMembers({required String communityId}) async {
    try {
      final communityMetadata = (await _repo.getCommunityMetadata(communityId: communityId))
          .map((e) => CommunityMetadata.fromJson(e))
          .toList();
      communityMetadata.removeWhere((element) => element.requesterId == UtilityService.currentUser?.uid);
      return await services.userService
          .getListOfUsersByIds(userIds: [for (final meta in communityMetadata) meta.requesterId]);
    } on DBException {
      rethrow;
    }
  }

  @override
  Future<List<DiscussionGroup>> getCommunityGroups({required String communityId}) async {
    try {
      final data = await _repo.getCommunityGroups(communityId: communityId);
      return data.map((e) => DiscussionGroup.fromJson(e)).toList();
    } on DBException catch (e, s) {
      rethrow;
    }
  }

  @override
  String generateDocumentId() {
    return UtilityService.generateDocumentId();
  }
}
