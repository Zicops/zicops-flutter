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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyCYFbbrFjYRCVNnaGf5KSk_h5vy1hmj-TU',
  //   appId: '1:142488541576:web:d5fbffe5c20ef70c99423d',
  //   messagingSenderId: '142488541576',
  //   projectId: 'zicops-23e57',
  //   authDomain: 'zicops-23e57.firebaseapp.com',
  //   storageBucket: 'zicops-23e57.appspot.com',
  //   measurementId: 'G-VGKN1LK3R3',
  // );

  // static const FirebaseOptions android = FirebaseOptions(
  //   apiKey: 'AIzaSyAHfUSlwaoEeTUBoGbFT8iLWdwCEUnk-9I',
  //   appId: '1:142488541576:android:c9679a13c1c7013499423d',
  //   messagingSenderId: '142488541576',
  //   projectId: 'zicops-23e57',
  //   storageBucket: 'zicops-23e57.appspot.com',
  // );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD05Uj8S-YumeJUiM4xuO8YFP7rjLJbrP8',
    appId: '1:359144709511:web:d8d41fb236983ea45f4722',
    messagingSenderId: '359144709511',
    projectId: 'zicops-one',
    authDomain: 'zicops-one.firebaseapp.com',
    storageBucket: 'zicops-one.appspot.com',
    measurementId: 'G-VGKN1LK3R3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD05Uj8S-YumeJUiM4xuO8YFP7rjLJbrP8',
    appId: '1:359144709511:web:d8d41fb236983ea45f4722',
    messagingSenderId: '359144709511',
    projectId: 'zicops-one',
    storageBucket: 'zicops-one.appspot.com',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdypSVLGIL-8PVVtfdD25d9nFtSN167xA',
    appId: '1:142488541576:ios:c00d039c3f985a1a99423d',
    messagingSenderId: '142488541576',
    projectId: 'zicops-23e57',
    storageBucket: 'zicops-23e57.appspot.com',
    iosClientId: '142488541576-qsh42pbeo7f39pupjpvk976m63h68ppf.apps.googleusercontent.com',
    iosBundleId: 'com.example.zicops',
  );
}
