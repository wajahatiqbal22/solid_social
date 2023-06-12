// Project imports:
import 'dart:developer';

import 'package:solid_social/shared/states/loading_state.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/community/domain/entities/community_metadata/community_metadata.dart';

class JoinCommunityController extends BootstrapController {
  JoinCommunityController(super.services) {
    init();
  }

  late List<Community> _joinedCommunities;
  set joinedCommunities(List<Community> communities) {
    _joinedCommunities = [...communities];
    notifyListeners();
  }

  late List<CommunityMetadata> _userInvitations;
  List<CommunityMetadata> get userInvitations => _userInvitations;
  set userInvitations(List<CommunityMetadata> invitations) {
    _userInvitations = invitations;
    notifyListeners();
  }

  LoadingState<List<CommunityMetadata>> _invitationState = const LoadingState.loading();
  LoadingState<List<CommunityMetadata>> get invitationState => _invitationState;
  set invitationState(LoadingState<List<CommunityMetadata>> state) {
    _invitationState = state;
    notifyListeners();
  }

  void updateState(CommunityMetadata metadata, CommunityRequestStatus status) {
    final foundIndex = userInvitations.indexWhere((element) => element.id == metadata.id);
    final invite = userInvitations[foundIndex].copyWith(status: status);
    userInvitations.removeAt(foundIndex);
    invitationState = LoadingState.loaded([...userInvitations, invite]);
    final community = joinedCommunities.firstWhere((element) => element.id == metadata.communityId);
    log('COMMUNITY:: ${community.communityName}');
    // joinCommunity(community, metadata.requesterId);
    notifyListeners();
  }

  LoadingState<List<Community>> _state = const LoadingState.loading();
  LoadingState<List<Community>> get state => _state;
  set state(LoadingState<List<Community>> state) {
    _state = state;
    notifyListeners();
  }

  List<Community> _justJoinedCommunities = [];
  List<Community> get justJoinedCommunities => _justJoinedCommunities;
  set justJoinedCommunities(List<Community> coms) {
    _justJoinedCommunities = [...coms];
    notifyListeners();
  }

  List<Community> get joinedCommunities => _joinedCommunities;

  void Function(Community community)? onJoiningCommunity;

  Future<void> getCommunities() async {
    state = const LoadingState.loading();
    joinedCommunities = await services.communityService.getCommunities();
    state = LoadingState.loaded(_joinedCommunities);
  }

  Future<void> joinCommunity(Community community, String userId) async {
    final joinedCommunity = await services.communityService.joinCommunity(community, userId);
    final jjc = [..._justJoinedCommunities];
    jjc.add(joinedCommunity);
    justJoinedCommunities = jjc;
    onJoiningCommunity?.call(joinedCommunity);
  }

  Future<void> getUserInvitations({required String userId}) async {
    try {
      invitationState = const LoadingState.loading();
      userInvitations = await services.communityService.getUserInvitations(userId: userId);
      invitationState = LoadingState.loaded(userInvitations);
    } catch (e) {
      log('Error in get user invitaions: $e');
    }
  }

  Future<void> acceptOrRejectUserInvitation(
      {required CommunityMetadata communityMetadata, required CommunityRequestStatus status}) async {
    try {
      await services.communityService.acceptOrRejectUserInvitation(
          userId: communityMetadata.requesterId, communityId: communityMetadata.communityId, status: status);
      updateState(communityMetadata, status);
    } catch (e) {
      log('Error in accept or reject user invitation: $e');
    }
  }

  init() async {
    await getCommunities();
  }

  int _number = 0;
  int get number => _number;

  changeNumber() {
    _number++;
    // notifyListeners();
  }
}
