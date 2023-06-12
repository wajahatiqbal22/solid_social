// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UtilityService {
  static String generateDocumentId() => FirebaseFirestore.instance.collection("random-id").doc().id;
  static User? get currentUser => FirebaseAuth.instance.currentUser;
}
