// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
class DefaultFirebaseOptions {
  /// Returns the [FirebaseOptions] for the current platform.
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError('DefaultFirebaseOptions have not been configured for macos - '
            'you can reconfigure this by running the FlutterFire CLI again.');
      case TargetPlatform.windows:
        throw UnsupportedError('DefaultFirebaseOptions have not been configured for windows - '
            'you can reconfigure this by running the FlutterFire CLI again.');
      case TargetPlatform.linux:
        throw UnsupportedError('DefaultFirebaseOptions have not been configured for linux - '
            'you can reconfigure this by running the FlutterFire CLI again.');
      case TargetPlatform.fuchsia:
        throw UnsupportedError('DefaultFirebaseOptions have not been configured for fuchsia - '
            'you can reconfigure this by running the FlutterFire CLI again.');
    }
  }

  /// FirebaseOptions for the web platform.
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBJJoagPGMD04flGcftw3GLCO8JiCgFCsQ',
    appId: '1:322192600034:web:8b1ddce628e4785878a7bb',
    messagingSenderId: '322192600034',
    projectId: 'flutter-app-60b07',
    authDomain: 'flutter-app-60b07.firebaseapp.com',
    storageBucket: 'flutter-app-60b07.appspot.com',
    measurementId: 'G-93T3ZMK9ZM',
  );

  /// FirebaseOptions for the Android platform.
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9ot_zB93u21VzU-sUL0PcsYn-yiShAds',
    appId: '1:322192600034:android:a47cd7f6659ea47378a7bb',
    messagingSenderId: '322192600034',
    projectId: 'flutter-app-60b07',
    storageBucket: 'flutter-app-60b07.appspot.com',
  );

  /// FirebaseOptions for the iOS platform.
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAp2sBXNPhIoKiYfTDL6N2QQct3MCRi2do',
    appId: '1:322192600034:ios:e994d1edba40983778a7bb',
    messagingSenderId: '322192600034',
    projectId: 'flutter-app-60b07',
    storageBucket: 'flutter-app-60b07.appspot.com',
    iosClientId: '322192600034-vop2vq1rgud9efce8ot019un252v8300.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}
