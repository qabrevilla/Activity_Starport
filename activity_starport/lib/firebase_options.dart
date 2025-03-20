// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBayemVnBnhyey12bsr0OOmmp6aGx0Lf20',
    appId: '1:630620837597:web:51a8f06349caaad95cad34',
    messagingSenderId: '630620837597',
    projectId: 'buildhub-training',
    authDomain: 'buildhub-training.firebaseapp.com',
    storageBucket: 'buildhub-training.firebasestorage.app',
    measurementId: 'G-YP0FY0MSLV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKPznx7T-Asv58yReIRH28saTHpF2HOGU',
    appId: '1:630620837597:android:8996a5af757196775cad34',
    messagingSenderId: '630620837597',
    projectId: 'buildhub-training',
    storageBucket: 'buildhub-training.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCk-Aj9kUefFGSEsd1tg8IWjzyVWoQWRWA',
    appId: '1:630620837597:ios:86ec7ddba0b0b29c5cad34',
    messagingSenderId: '630620837597',
    projectId: 'buildhub-training',
    storageBucket: 'buildhub-training.firebasestorage.app',
    iosBundleId: 'com.example.activityStarport',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCk-Aj9kUefFGSEsd1tg8IWjzyVWoQWRWA',
    appId: '1:630620837597:ios:86ec7ddba0b0b29c5cad34',
    messagingSenderId: '630620837597',
    projectId: 'buildhub-training',
    storageBucket: 'buildhub-training.firebasestorage.app',
    iosBundleId: 'com.example.activityStarport',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBayemVnBnhyey12bsr0OOmmp6aGx0Lf20',
    appId: '1:630620837597:web:61524cd4cee9f1c55cad34',
    messagingSenderId: '630620837597',
    projectId: 'buildhub-training',
    authDomain: 'buildhub-training.firebaseapp.com',
    storageBucket: 'buildhub-training.firebasestorage.app',
    measurementId: 'G-TY3Q4DLW11',
  );
}
