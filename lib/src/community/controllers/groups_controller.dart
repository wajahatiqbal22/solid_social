// Dart imports:
import 'dart:io';

// Package imports:
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:synchronized/synchronized.dart';

// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/shared/utility/utility_service.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap_controller.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group_dto.dart';

class GroupsController extends BootstrapController {
  late final Community? selectedCommunity;

  GroupsController(super.services, this.selectedCommunity);

  factory GroupsController.initialize(Community community) {
    return GroupsController(Bootstrap(), community);
  }

  Loading _state = Loading.idle;
  Loading get state => _state;
  set state(Loading state) {
    _state = state;
    notifyListeners();
  }

  List<SolidSocialUser> members = [];
  List<SolidSocialUser> selectedMembers = [];
  List<DiscussionGroup> communityGroups = [];

  void softCreateDiscussionGroup({
    required String groupName,
    required DiscussionGroupPrivacy privacy,
    required String communityId,
    void Function(DiscussionGroup)? onCreated,
  }) {
    final DiscussionGroup group = DiscussionGroup(
        id: UtilityService.generateDocumentId(),
        ownerId: services.authService.currentUser!.uid,
        communityId: communityId,
        groupName: groupName,
        createdAt: DateTime.now());
    onCreated?.call(group);
  }

  Future<void> createDiscussionGroup({
    required DiscussionGroup group,
    required List<String> memberIds,
    File? photoFile,
    File? bannerFile,
    void Function(DiscussionGroup, Channel)? onCreated,
    void Function(DBException)? onError,
  }) async {
    try {
      state = Loading.processing;
      final Lock lock = Lock();
      await lock.synchronized(() async {
        final discussionGroup = await services.groupsService.createDiscussionGroup(
          memberIds: memberIds,
          group: group,
          bannerFile: bannerFile,
          photoFile: photoFile,
        );
        final channel = services.chatClient.client.channel(
          "team",
          id: "${discussionGroup.communityId}_${discussionGroup.id}",
          extraData: {
            "communityId": discussionGroup.communityId,
            "groupData": discussionGroup.toStreamchatJson(),
            "members": memberIds.toSet().toList(),
          },
        );

        state = Loading.loaded;
        onCreated?.call(discussionGroup, channel);
      });
    } on DBException catch (e) {
      state = Loading.error;
      onError?.call(e);
    } catch (e) {
      state = Loading.error;
    }
  }

  void updateAllSelectedMembers(bool select) {
    if (select) {
      selectedMembers = [...members];
    } else {
      selectedMembers.clear();
    }
    chips = _assembleData();
  }

  Future<void> updateGroup(
      {required DiscussionGroupDTO group,
      Function(DiscussionGroup)? onSuccess,
      Function(DBException onError)? onError}) async {
    try {
      state = Loading.processing;
      final discussionGroup = await services.groupsService.updateGroup(groupDTO: group);
      state = Loading.loaded;
      onSuccess?.call(discussionGroup);
    } on DBException catch (e, s) {
      state = Loading.idle;
      onError?.call(e);
    }
  }

  Future<void> getCommunityMembers() async {
    try {
      state = Loading.processing;
      members = await services.groupsService.getCommunityMembers(communityId: selectedCommunity!.id!);
      state = Loading.loaded;
    } on DBException catch (e) {
      state = Loading.error;
    }
  }

  Future<void> getCommunityGroups() async {
    state = Loading.processing;
    communityGroups = await services.groupsService.getCommunityGroups(communityId: selectedCommunity!.id!);
    state = Loading.loaded;
  }

  void updateSelectedMembers(SolidSocialUser user, bool isSelected) {
    if (isSelected) {
      selectedMembers.add(user);
    } else {
      selectedMembers.removeWhere((element) => element.uid == user.uid);
    }
    chips = _assembleData();
  }

  List<List<SolidSocialUser>> _chips = [];

  List<List<SolidSocialUser>> get chips => _chips;
  set chips(List<List<SolidSocialUser>> chips) {
    _chips = [...chips];
    notifyListeners();
  }

  List<List<SolidSocialUser>> _assembleData() {
    int limit = 3;
    int startIndex = 0;
    List<List<SolidSocialUser>> localChips = [];
    final List<SolidSocialUser> usersToAdd = [];

    for (int userIndex = startIndex; userIndex < selectedMembers.length; userIndex++) {
      usersToAdd.add(selectedMembers[userIndex]);
      if (userIndex == (limit - 1 + startIndex)) {
        localChips.add([...usersToAdd]);
        startIndex = userIndex;
        usersToAdd.clear();
      }
    }

    localChips.add(usersToAdd);

    return localChips;
  }

  // final rows = <SolidSocialUser>[];
  List<SolidSocialUser> users = <SolidSocialUser>[];
}
