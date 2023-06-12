// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';

class CreateCommunityController extends BootstrapController {
  CreateCommunityController(super.services)
      : _newCommunity =
            Community.newCommunity(services.authService.currentUser!.uid);

  late Community _newCommunity;
  Community get community => _newCommunity;
  set community(Community comm) => _newCommunity = comm;

  Loading _state = Loading.idle;
  Loading get state => _state;
  set state(Loading state) {
    _state = state;
    notifyListeners();
  }

  void Function(Community community)? onCreateCommunity;
  VoidCallback? dummy;

  Future<void> createCommunity({
    required String name,
    required List<String> interests,
    required String privacy,
    void Function(Community community)? onSuccess,
    void Function(DBException exception)? onError,
  }) async {
    try {
      state = Loading.processing;
      Community community = Community(
        ownerId: services.authService.currentUser!.uid,
        communityName: name,
        areaOfInterest: interests,
        createdAt: DateTime.now(),
      );

      community = await services.communityService.createCommunity(community);

      onCreateCommunity?.call(community);
      onSuccess?.call(community);
      state = Loading.loaded;
    } on DBException catch (e, s) {
      state = Loading.error;
      onError?.call(e);
    }
  }

  void callSumFunc() {
    dummy?.call();
  }
}
