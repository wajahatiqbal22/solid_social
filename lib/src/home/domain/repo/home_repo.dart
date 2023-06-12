// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:solid_social/src/community/domain/repo/community_repo.dart';

abstract class HomeRepo {
  Future<List<Map<String, dynamic>>> getHomeCommunities();
}

class IHomeRepo implements HomeRepo {
  IHomeRepo();
  final CommunityRepo _communitiesRepo = ICommunityRepo();
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Map<String, dynamic>>> getHomeCommunities() async {
    final homeRepoData = await _communitiesRepo.getUserCommunities(_firebaseAuth.currentUser!.uid);
    return homeRepoData;
  }
}
