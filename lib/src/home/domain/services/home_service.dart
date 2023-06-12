// Project imports:
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/home/domain/repo/home_repo.dart';

abstract class HomeService {
  Future<List<Community>> getHomeCommunities();
}

class IHomeService implements HomeService {
  final HomeRepo _repo = IHomeRepo();
  @override
  Future<List<Community>> getHomeCommunities() async {
    final data = await _repo.getHomeCommunities();
    return data.map((e) => Community.fromJson(e)).toList();
  }
}
