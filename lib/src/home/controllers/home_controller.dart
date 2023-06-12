// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/src/community/controllers/communities_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';

class HomeController extends CommunityController {
  HomeController(super.services) {
    _init();
  }
  List<Community> _communities = [];
  List<Community> get communities => _communities;
  set(List<Community> communities) {
    _communities = [...communities];
    notifyListeners();
  }

  Future<void> _init() async {
    state = Loading.processing;

    createCommunityController.onCreateCommunity = onCreateCommunity;
    joinCommunityController.onJoiningCommunity = onCreateCommunity;
    _communities = await getHomeCommunities();

    if (_communities.isNotEmpty) {
      selectedCommunity = _communities.elementAt(0);

      _communities.removeAt(0);
    }
    state = Loading.loaded;
  }

  Future<List<Community>> getHomeCommunities() async {
    return await services.homeService.getHomeCommunities();
  }

  void changeSelectedCommunity(Community community) {
    if (selectedCommunity != null) {
      _communities.add(selectedCommunity!);
    }
    _communities.removeWhere((element) => element.id == community.id);
    selectedCommunity = community;
  }

  void onCreateCommunity(Community community) {
    changeSelectedCommunity(community);
  }
}
