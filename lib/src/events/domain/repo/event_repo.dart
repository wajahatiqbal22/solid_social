import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/src/community/domain/entities/members/member.dart';
import 'package:solid_social/src/events/domain/entities/event/event.dart';

abstract class EventRepo {
  Future<Map<String, dynamic>> createEvent(Event event);
  Future<List<Map<String, dynamic>>> getEvents({required String communityId});
  Future<List<Map<String, dynamic>?>> getEventMembers({required List<String> groupIds});
}

class IEventRepo implements EventRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get _eventsRef => _firestore.collection("events");

  @override
  Future<Map<String, dynamic>> createEvent(Event event) async {
    try {
      await _eventsRef.doc(event.eventId).set(event.toJson());
      return event.toJson();
    } on FirebaseException catch (e, s) {
      throw DBException.unknown(e.message);
    } on DBException catch (e, s) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getEvents({required String communityId}) async {
    try {
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day, 0, 0);
      final snapshot = await _eventsRef
          .where('communityId', isEqualTo: communityId)
          .where("eventDateTime", isGreaterThanOrEqualTo: todayStart)
          .get();

      return snapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, s) {
      throw DBException.unknown(e.message);
    } on DBException {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>?>> getEventMembers({required List<String> groupIds}) async {
    try {
      final members = [
        for (final id in groupIds)
          ...(await _firestore.collection("discussionGroups").doc(id).collection("members").get())
              .docs
              .map((e) => Member.fromJson(e.data()))
      ];

      final data = [for (final m in members) (await _firestore.collection("users").doc(m.userId).get()).data()];

      return data;
      // final List<Map<String, dynamic>> membersData = [for (final id in groupIds) ...(await _firestore.collection("discussion_groups").doc(id).collection("members").get()..docs.map((e) => e.data()).toList())]
    } on FirebaseException catch (e, s) {
      throw DBException.unknown(e.message);
    } on DBException catch (e, s) {
      rethrow;
    }
  }
}
