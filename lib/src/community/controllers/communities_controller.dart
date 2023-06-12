// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/community/controllers/create_community_controller.dart';
import 'package:solid_social/src/community/controllers/groups_controller.dart';
import 'package:solid_social/src/community/controllers/join_communities_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/home/domain/controller/timeline_controller.dart';

class CommunityController extends ChangeNotifier {
  late final JoinCommunityController joinCommunityController;
  late final CreateCommunityController createCommunityController;
  GroupsController? _groupsController;
  TimelineController? _timelineController;
  Bootstrap services;

  GroupsController? get groupsController => _groupsController;
  TimelineController? get timelineController => _timelineController;

  Community? _selectedCommunity;
  set selectedCommunity(Community? community) {
    _selectedCommunity = community;
    _initialize();
    notifyListeners();
  }

  Loading _state = Loading.idle;
  Loading get state => _state;
  set state(Loading state) {
    _state = state;
    notifyListeners();
  }

  Community? get selectedCommunity => _selectedCommunity;

  CommunityController(this.services) {
    joinCommunityController = JoinCommunityController(services);
    createCommunityController = CreateCommunityController(services);
  }

  Future<void> _initialize() async {
    state = Loading.processing;
    initializeControllers(
        groupsController: GroupsController(services, selectedCommunity!),
        timelineController: TimelineController(services, selectedCommunity: selectedCommunity!));
    await getTimelinePosts();

    state = Loading.loaded;
  }

  Future<void> getTimelinePosts() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  void initializeControllers(
      {required GroupsController groupsController, required TimelineController timelineController}) {
    _groupsController = groupsController;
    _timelineController = timelineController;
    notifyListeners();
  }
}
