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
    apiKey: 'AIzaSyCwh0fm7eV5DNBZQHolC7P6N9y_7qWyzOM',
    appId: '1:788030446427:web:d551937224c472bf5b587e',
    messagingSenderId: '788030446427',
    projectId: 'breakdown-assist-project',
    authDomain: 'breakdown-assist-project.firebaseapp.com',
    storageBucket: 'breakdown-assist-project.appspot.com',
    measurementId: 'G-MYSW35HXZS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeYKAPfNn9eSE-erJf8Ynu1S2QbAWgXv4',
    appId: '1:788030446427:android:1b014af447da83a15b587e',
    messagingSenderId: '788030446427',
    projectId: 'breakdown-assist-project',
    storageBucket: 'breakdown-assist-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8S0973B0fuw98IpMG5FzuBDAzte4w8NY',
    appId: '1:788030446427:ios:e7353545503f8d1e5b587e',
    messagingSenderId: '788030446427',
    projectId: 'breakdown-assist-project',
    storageBucket: 'breakdown-assist-project.appspot.com',
    iosBundleId: 'com.example.breakdownAssist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8S0973B0fuw98IpMG5FzuBDAzte4w8NY',
    appId: '1:788030446427:ios:bfe813c435e462ef5b587e',
    messagingSenderId: '788030446427',
    projectId: 'breakdown-assist-project',
    storageBucket: 'breakdown-assist-project.appspot.com',
    iosBundleId: 'com.example.breakdownAssist.RunnerTests',
  );
}
