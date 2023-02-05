import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_translator/b_views/a_screens/a_youtube_translator_app.dart';
import 'package:video_translator/firebase_options.dart';

Future<void> main() async {
  // --------------------------------------------------------------------------
  WidgetsFlutterBinding.ensureInitialized();
  // --------------------
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // --------------------
  return runApp(const YouTubeTranslatorApp());
  // --------------------------------------------------------------------------
}
