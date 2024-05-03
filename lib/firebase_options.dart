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
    apiKey: 'AIzaSyACvPgRMX0YdTChTXsLl9MGP-aLpVwfb7g',
    appId: '1:188127609386:web:b2f890f2dc3424592f7953',
    messagingSenderId: '188127609386',
    projectId: 'usafe-136e9',
    authDomain: 'usafe-136e9.firebaseapp.com',
    storageBucket: 'usafe-136e9.appspot.com',
    measurementId: 'G-T50JH7Z9TH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUjsLTwT9j8AVN0WZUJ4M5RAONzE8Xzr8',
    appId: '1:188127609386:android:82d3d7459ddbaa262f7953',
    messagingSenderId: '188127609386',
    projectId: 'usafe-136e9',
    storageBucket: 'usafe-136e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJzmNZB3XhCkB53xqwBN-fmGIEh1_TJqI',
    appId: '1:188127609386:ios:7f660202720e7ff52f7953',
    messagingSenderId: '188127609386',
    projectId: 'usafe-136e9',
    storageBucket: 'usafe-136e9.appspot.com',
    iosBundleId: 'com.usafe.meta',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJzmNZB3XhCkB53xqwBN-fmGIEh1_TJqI',
    appId: '1:188127609386:ios:83c14059c328eb7f2f7953',
    messagingSenderId: '188127609386',
    projectId: 'usafe-136e9',
    storageBucket: 'usafe-136e9.appspot.com',
    iosBundleId: 'com.cryptomask.dev',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyACvPgRMX0YdTChTXsLl9MGP-aLpVwfb7g',
    appId: '1:188127609386:web:4527dcd665b843ba2f7953',
    messagingSenderId: '188127609386',
    projectId: 'usafe-136e9',
    authDomain: 'usafe-136e9.firebaseapp.com',
    storageBucket: 'usafe-136e9.appspot.com',
    measurementId: 'G-THRZNT4SMP',
  );

}