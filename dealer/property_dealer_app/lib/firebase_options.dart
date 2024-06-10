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
    apiKey: 'AIzaSyBAL_IF6OJZzVbd0wOO7zpVonrJVsKydeM',
    appId: '1:809847024730:web:2f911a6af6bf3da20efc63',
    messagingSenderId: '809847024730',
    projectId: 'propertyapp-c8111',
    authDomain: 'propertyapp-c8111.firebaseapp.com',
    storageBucket: 'propertyapp-c8111.appspot.com',
    measurementId: 'G-SJL1XVJ2WZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrpg2cN-KKEieLZ9k7fdxyhhb_R3IeTRs',
    appId: '1:809847024730:android:0acce9bebfd72b9e0efc63',
    messagingSenderId: '809847024730',
    projectId: 'propertyapp-c8111',
    storageBucket: 'propertyapp-c8111.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaa3sR1ylyA5rQmupVLcHbkDIJgOPzHBQ',
    appId: '1:809847024730:ios:89e6cca3dee813860efc63',
    messagingSenderId: '809847024730',
    projectId: 'propertyapp-c8111',
    storageBucket: 'propertyapp-c8111.appspot.com',
    iosClientId: '809847024730-g6a35mq6s5rotpg7c3hspiuvt0o73ojg.apps.googleusercontent.com',
    iosBundleId: 'com.auribises.propertyDealerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaa3sR1ylyA5rQmupVLcHbkDIJgOPzHBQ',
    appId: '1:809847024730:ios:89e6cca3dee813860efc63',
    messagingSenderId: '809847024730',
    projectId: 'propertyapp-c8111',
    storageBucket: 'propertyapp-c8111.appspot.com',
    iosClientId: '809847024730-g6a35mq6s5rotpg7c3hspiuvt0o73ojg.apps.googleusercontent.com',
    iosBundleId: 'com.auribises.propertyDealerApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBAL_IF6OJZzVbd0wOO7zpVonrJVsKydeM',
    appId: '1:809847024730:web:7ebf7005d6646f660efc63',
    messagingSenderId: '809847024730',
    projectId: 'propertyapp-c8111',
    authDomain: 'propertyapp-c8111.firebaseapp.com',
    storageBucket: 'propertyapp-c8111.appspot.com',
    measurementId: 'G-61NLT5T95R',
  );
}