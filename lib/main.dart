import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_translator/b_views/a_screens/a_app_starter.dart';
import 'package:video_translator/firebase_options.dart';

const String videoTranslatorAppVersion = '1.0.6';

Future<void> main() async {
  // --------------------------------------------------------------------------
  WidgetsFlutterBinding.ensureInitialized();
  // --------------------
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // --------------------
  return runApp(const AppStarter());
  // --------------------------------------------------------------------------
}
