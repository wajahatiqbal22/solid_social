import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/events/domain/entities/event/event.dart';
import 'package:solid_social/src/events/domain/repo/event_repo.dart';

abstract class EventService {
  Future<Event> createEvent(Event event);
  Future<List<Event>> getEvents({required String communityId});
  Future<List<SolidSocialUser>> getMembers({required List<String> groupIds});
}

class IEventService implements EventService {
  final EventRepo _eventRepo = IEventRepo();

  @override
  Future<Event> createEvent(Event event) async {
    try {
      final rawEvent = await _eventRepo.createEvent(event);
      return Event.fromJson(rawEvent);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Event>> getEvents({required String communityId}) async {
    try {
      final rawEvents = await _eventRepo.getEvents(communityId: communityId);
      return rawEvents.map((e) => Event.fromJson(e)).toList();
    } on DBException {
      rethrow;
    }
  }

  @override
  Future<List<SolidSocialUser>> getMembers({
    required List<String> groupIds,
  }) async {
    try {
      final rawEvent = (await _eventRepo.getEventMembers(groupIds: groupIds))
          .map((e) => e == null ? null : SolidSocialUser.fromJson(e))
          .toList();
      return rawEvent.whereType<SolidSocialUser>().toList();
    } catch (e) {
      rethrow;
    }
  }
}
