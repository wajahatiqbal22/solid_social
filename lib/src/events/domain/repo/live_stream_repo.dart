import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solid_social/src/events/domain/entities/live_user/live_user.dart';

abstract class LiveSessionRepo {
  Stream<List<LiveUser>> streamLiveUsers(String eventId);
  Future<void> updateLiveUsers(String eventId, LiveUser user);
  Future<void> leaveSession(String eventId, String userId);
}

class ILiveSessionRepo implements LiveSessionRepo {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  CollectionReference<LiveUser> _liveUsersRef(String eventId) => _firestore
          .collection("events")
          .doc(eventId)
          .collection("liveSession")
          .withConverter(fromFirestore: (snapshot, _) {
        return LiveUser.fromJson(snapshot.data()!);
      }, toFirestore: (user, _) {
        return user.toJson();
      });

  @override
  Stream<List<LiveUser>> streamLiveUsers(String eventId) {
    return _liveUsersRef(eventId).snapshots().transform<List<LiveUser>>(generateListTransformer<LiveUser>());
  }

  StreamTransformer<QuerySnapshot<X>, List<X>> generateListTransformer<X>() {
    return StreamTransformer<QuerySnapshot<X>, List<X>>.fromHandlers(handleError: (err, stk, sink) {
      sink.addError(err, stk);
    }, handleData: (QuerySnapshot<X> snap, sink) {
      final List<X> data = List.empty(growable: true);
      for (final doc in snap.docs) {
        data.add(doc.data());
      }
      sink.add(data);
    });
  }

  @override
  Future<void> updateLiveUsers(String eventId, LiveUser user) async {
    await _liveUsersRef(eventId).doc(user.id).set(user, SetOptions(merge: true));
  }

  @override
  Future<void> leaveSession(String eventId, String userId) async {
    await _liveUsersRef(eventId).doc(userId).delete();
  }
}
