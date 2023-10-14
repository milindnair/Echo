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
    apiKey: 'AIzaSyANpSOOy5XPChuTBwid82HJl-eT5qGKD7g',
    appId: '1:118316099914:web:79e269cbc9038f3805b9b3',
    messagingSenderId: '118316099914',
    projectId: 'echo-8206c',
    authDomain: 'echo-8206c.firebaseapp.com',
    storageBucket: 'echo-8206c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrhWy0SYGAXQFWkIl5kIsHeJ3ryhop25I',
    appId: '1:118316099914:android:c7d71c7ff76c042f05b9b3',
    messagingSenderId: '118316099914',
    projectId: 'echo-8206c',
    storageBucket: 'echo-8206c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClxa6oez_vR_QG8GtFiN-U7bN_8AePXcs',
    appId: '1:118316099914:ios:d28708555923276c05b9b3',
    messagingSenderId: '118316099914',
    projectId: 'echo-8206c',
    storageBucket: 'echo-8206c.appspot.com',
    iosBundleId: 'com.example.echo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClxa6oez_vR_QG8GtFiN-U7bN_8AePXcs',
    appId: '1:118316099914:ios:4826535bf40f9c7805b9b3',
    messagingSenderId: '118316099914',
    projectId: 'echo-8206c',
    storageBucket: 'echo-8206c.appspot.com',
    iosBundleId: 'com.example.echo.RunnerTests',
  );
}