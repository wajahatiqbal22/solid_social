// Project imports:
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/community/domain/entities/community_metadata/community_metadata.dart';
import 'package:solid_social/src/community/domain/repo/community_repo.dart';

abstract class CommunityService {
  Future<Community> createCommunity(Community community);
  Future<List<Community>> getCommunities();
  Future<List<Community>> getUserCommunities(String userId);
  Future<Community> joinCommunity(Community community, String userId);
  Future<List<CommunityMetadata>> getUserInvitations({required String userId});
  Future<void> acceptOrRejectUserInvitation(
      {required String userId, required String communityId, required CommunityRequestStatus status});
}

class ICommunityService implements CommunityService {
  ICommunityService();

  final CommunityRepo _repo = ICommunityRepo();
  @override
  Future<Community> createCommunity(Community community) async {
    try {
      final rawData = await _repo.createCommunity(community);
      return Community.fromJson(rawData);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Community>> getCommunities() async {
    return [for (final data in await _repo.getCommunities()) Community.fromJson(data)];
  }

  @override
  Future<List<Community>> getUserCommunities(String userId) {
    // TODO: implement getUserCommunities
    throw UnimplementedError();
  }

  @override
  Future<Community> joinCommunity(Community community, String userId) async {
    await _repo.joinCommunity(community, userId);
    return community;
  }

  @override
  Future<void> acceptOrRejectUserInvitation(
      {required String userId, required String communityId, required CommunityRequestStatus status}) async {
    try {
      await _repo.acceptOrRejectUserInvitation(userId: userId, communityId: communityId, status: status);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CommunityMetadata>> getUserInvitations({required String userId}) async {
    try {
      return [for (final data in await _repo.getUserInvitations(userId: userId)) CommunityMetadata.fromJson(data)];
    } catch (e) {
      rethrow;
    }
  }
}
