// Flutter imports:

import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Project imports:
import 'package:solid_social/src/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();

  // final engine = createAgoraRtcEngineEx();

  //DUMMY
  // await FirebaseAuth.instance.signOut();
  runApp(const App());
}
