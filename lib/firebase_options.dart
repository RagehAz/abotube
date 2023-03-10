// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBINihd2Xbj4o9t5oiqgo7QAsvpDBXQ6SE',
    appId: '1:1003450512869:web:4bc76a39c8c794f7ffeb0c',
    messagingSenderId: '1003450512869',
    projectId: 'video-translator-37ed3',
    authDomain: 'video-translator-37ed3.firebaseapp.com',
    storageBucket: 'video-translator-37ed3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2tlX0iDbGRRa06fC1VenJauPqTnrSTMA',
    appId: '1:1003450512869:android:741e7225e69d7d96ffeb0c',
    messagingSenderId: '1003450512869',
    projectId: 'video-translator-37ed3',
    storageBucket: 'video-translator-37ed3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLHxiZ6obYZ-YAZNkSp061gNhJ03490fg',
    appId: '1:1003450512869:ios:773cf2f2c4c02950ffeb0c',
    messagingSenderId: '1003450512869',
    projectId: 'video-translator-37ed3',
    storageBucket: 'video-translator-37ed3.appspot.com',
    iosClientId: '1003450512869-0he8njpnhm9lklo2ba7jp4dl109dmms8.apps.googleusercontent.com',
    iosBundleId: 'com.example.videoTranslator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLHxiZ6obYZ-YAZNkSp061gNhJ03490fg',
    appId: '1:1003450512869:ios:773cf2f2c4c02950ffeb0c',
    messagingSenderId: '1003450512869',
    projectId: 'video-translator-37ed3',
    storageBucket: 'video-translator-37ed3.appspot.com',
    iosClientId: '1003450512869-0he8njpnhm9lklo2ba7jp4dl109dmms8.apps.googleusercontent.com',
    iosBundleId: 'com.example.videoTranslator',
  );
}
