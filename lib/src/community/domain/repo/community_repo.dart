// Dart imports:
import 'dart:developer';
import 'dart:io';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:solid_social/constants/firebase_cloud_functions.dart';
// Project imports:
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/community/domain/entities/community_metadata/community_metadata.dart';
import 'package:solid_social/src/community/domain/entities/members/member.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group_dto.dart';

abstract class CommunityRepo {
  Future<Map<String, dynamic>> createCommunity(Community community);
  Future<List<Map<String, dynamic>>> getCommunities({int? limit});
  Future<List<Map<String, dynamic>>> getUserCommunities(String userId);
  Future<void> joinCommunity(Community community, String userId);
  Future<Map<String, dynamic>> createDiscussionGroup(
    DiscussionGroup group, {
    File? photoFile,
    File? bannerFile,
    required List<String> memberIds,
  });
  Future<Map<String, dynamic>> updateGroup({required DiscussionGroupDTO groupDTO});
  Future<List<Map<String, dynamic>>> getCommunityMetadata({required String communityId});

  Future<List<Map<String, dynamic>>> getCommunityGroups({required String communityId});
  Future<List<Map<String, dynamic>>> getUserInvitations({required String userId});
  Future<void> acceptOrRejectUserInvitation(
      {required String userId, required String communityId, required CommunityRequestStatus status});
}

class ICommunityRepo implements CommunityRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDynamicLinks _firebaseDynamicLinks = FirebaseDynamicLinks.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instanceFor(region: 'asia-south1');

  String get discussionGroupCollectionName => "discussionGroups";
  String get communityMetaDataCollectionName => "communities_metadata";
  String get groupMembersCollectionName => "members";
  User get currentUser => _auth.currentUser!;

  CollectionReference<Map<String, dynamic>> get _communitiesRef => _firestore.collection("communities");
  CollectionReference<Map<String, dynamic>> get _communitiesMetadata =>
      _firestore.collection(communityMetaDataCollectionName);

  CollectionReference<Map<String, dynamic>> get _communityDiscussionGroupsRef =>
      _firestore.collection("discussionGroups");
  CollectionReference<Map<String, dynamic>> _communityGroupMembersRef(groupId) =>
      _communityDiscussionGroupsRef.doc(groupId).collection(groupMembersCollectionName);

  @override
  Future<Map<String, dynamic>> createCommunity(Community community) async {
    try {
      final communityId = _communitiesRef.doc().id;
      final communityMetaId = _communitiesMetadata.doc().id;

      community = community.copyWith(id: communityId, shareLink: await buildDynamicLinkForCommunity(communityId));
      final CommunityMetadata meta = CommunityMetadata(
        ownerId: community.ownerId,
        communityName: community.communityName,
        requesterId: _auth.currentUser!.uid,
        id: communityMetaId,
        status: CommunityRequestStatus.accepted,
        areaOfInterests: community.areaOfInterest,
        communityId: community.id!,
      );
      final batch = _firestore.batch();

      batch.set(_communitiesRef.doc(community.id), community.toJson());
      batch.set(_communitiesMetadata.doc(communityMetaId), meta.toJson());

      await batch.commit();

      return community.toJson();
    } on FirebaseException catch (e, s) {
      throw DBException.unknown(e.message);
    } on DBException catch (e, s) {
      rethrow;
    }
  }

  Future<String?> buildDynamicLinkForCommunity(String communityId) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://solidsocialapp.page.link/"),
      uriPrefix: "https://solidsocialapp.page.link",
      androidParameters: const AndroidParameters(packageName: "com.solidsocial.app.dev"),
      iosParameters: const IOSParameters(bundleId: "com.solidsocial.app.dev"),
    );
    final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }

  @override
  Future<List<Map<String, dynamic>>> getCommunities({int? limit}) async {
    final query = _communitiesMetadata
        .where("requesterId", isEqualTo: _auth.currentUser!.uid)
        .where("status", isEqualTo: CommunityRequestStatus.accepted.name);

    final metaSnapshot = await query.get();
    final docIds = metaSnapshot.docs.map((e) => e.data()['communityId']).toList();
    final snapshot =
        await _communitiesRef.where(FieldPath.documentId, whereNotIn: docIds.isEmpty ? ["zero"] : docIds).get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserCommunities(String userId) async {
    final query = _communitiesMetadata
        .where("requesterId", isEqualTo: userId)
        .where("status", isEqualTo: CommunityRequestStatus.accepted.name);

    final metaSnapshot = await query.get();
    if (metaSnapshot.docs.isEmpty) return [];
    final docIds = metaSnapshot.docs.map((e) => e.data()['communityId']).toList();
    final snapshot = await _communitiesRef.where(FieldPath.documentId, whereIn: docIds).get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  @override
  Future<void> joinCommunity(Community community, String userId) async {
    final meta = _generateCommunityMetadata(community, userId, CommunityRequestStatus.accepted);
    // final member = _generateCommunityMember(communityId: community.id!, memberId: userId);
    await _communitiesMetadata.doc(meta.id).set(meta.toJson());
    final instance = _functions.httpsCallable(CloudFunctions.addUserToChannel);
    await instance.call({"channelId": community.id, "userId": userId});
    // await _communityMembersRef(community.id!).doc(userId).set(member.toJson());
  }

  Member _generateCommunityMember({required String communityId, required String memberId}) {
    return Member(userId: memberId, communityId: communityId, joinedAt: DateTime.now());
  }

  List<Member> _generateCommunityMembersList({required String communityId, required List<String> memberIds}) {
    return memberIds.map((e) => Member(userId: e, communityId: communityId, joinedAt: DateTime.now())).toList();
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

  CommunityMetadata _generateCommunityMetadata(Community community, userId, CommunityRequestStatus status) {
    final communityMetaId = _communitiesMetadata.doc().id;
    return CommunityMetadata(
      ownerId: community.ownerId,
      communityName: community.communityName,
      requesterId: userId,
      id: communityMetaId,
      status: status,
      areaOfInterests: community.areaOfInterest,
      communityId: community.id!,
      joinedAt: DateTime.now(),
    );
  }

  @override
  Future<Map<String, dynamic>> createDiscussionGroup(
    DiscussionGroup group, {
    File? photoFile,
    File? bannerFile,
    required List<String> memberIds,
  }) async {
    try {
      group = group.copyWith(
        bannerUrl: await _uploadPhoto(_storage.ref('${group.communityId}/groups/${"banner_" + group.id}'), bannerFile),
        displayPhotoUrl:
            await _uploadPhoto(_storage.ref('${group.communityId}/groups/${"displayPhotoUrl" + group.id}'), photoFile),
      );
      memberIds.add(_auth.currentUser!.uid);
      final members = _generateCommunityMembersList(communityId: group.communityId, memberIds: memberIds);
      await _communityDiscussionGroupsRef.doc(group.id).set(group.toJson());

      final batch = _firestore.batch();
      for (final m in members) {
        batch.set(_communityGroupMembersRef(group.id).doc(m.userId), m.toJson());
      }

      batch.commit();

      return group.toJson();
    } catch (e) {
      throw DBException.unknown("Something went wrong while creating a discussion group: $e");
    }
  }

  @override
  Future<Map<String, dynamic>> updateGroup({required DiscussionGroupDTO groupDTO}) async {
    final data = _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(_communityDiscussionGroupsRef.doc(groupDTO.id));
      DiscussionGroup discussionGroup = DiscussionGroup.fromJson(snapshot.data()!);
      discussionGroup = discussionGroup.copyWith(
        bannerUrl: await _uploadPhoto(
          _storage.ref('${discussionGroup.communityId}/groups/${discussionGroup.id}'),
          groupDTO.bannerUrl,
        ),
        displayPhotoUrl: await _uploadPhoto(
          _storage.ref('${discussionGroup.communityId}/groups/${discussionGroup.id}'),
          groupDTO.displayPhotoUrl,
        ),
      );

      final data = {...discussionGroup.toJson(), ...groupDTO.toJson()};
      transaction.set(snapshot.reference, data, SetOptions(merge: true));
      return data;
    });

    return data;
  }

  @override
  Future<List<Map<String, dynamic>>> getCommunityMetadata({required String communityId}) async {
    try {
      final snapshot = await _communitiesMetadata
          .where("communityId", isEqualTo: communityId)
          .where("status", isEqualTo: CommunityRequestStatus.accepted.name)
          .get();

      return snapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      throw DBException.error(e.message, e.code);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCommunityGroups({required String communityId}) async {
    try {
      final snapshot = await _communityDiscussionGroupsRef.where("communityId", isEqualTo: communityId).get();

      return snapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, s) {
      throw DBException.error(e.message, e.code);
    } on DBException catch (e, s) {
      rethrow;
    }
  }

  @override
  Future<void> acceptOrRejectUserInvitation(
      {required String userId, required String communityId, required CommunityRequestStatus status}) async {
    try {
      final docRef = await _communitiesMetadata
          .where('requesterId', isEqualTo: userId)
          .where('communityId', isEqualTo: communityId)
          .get()
          .then((value) => value.docs[0].reference);
      var batch = _firestore.batch();
      batch.update(docRef, {'status': status.name});
      batch.commit();
      if (status == CommunityRequestStatus.accepted) {
        final instance = _functions.httpsCallable(CloudFunctions.addUserToChannel);
        await instance.call({"channelId": communityId, "userId": userId});
      }
    } on FirebaseException catch (e) {
      throw DBException.error(e.message, e.code);
    } on DBException catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getUserInvitations({required String userId}) async {
    try {
      final snapshot = await _communitiesMetadata
          .where('status', isEqualTo: CommunityRequestStatus.pending.name)
          .where('requesterId', isEqualTo: userId)
          .get();
      return snapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      throw DBException.error(e.message, e.code);
    } on DBException catch (e) {
      rethrow;
    }
  }
}
