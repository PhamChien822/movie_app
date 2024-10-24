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
    apiKey: 'AIzaSyDRRN64Q8B4rP3KrdwSSY0fnWgZZFiwpjc',
    appId: '1:743496744030:web:479c3d388fa4fff3c048cf',
    messagingSenderId: '743496744030',
    projectId: 'movieapp-4fdc0',
    authDomain: 'movieapp-4fdc0.firebaseapp.com',
    storageBucket: 'movieapp-4fdc0.appspot.com',
    measurementId: 'G-VF70YE68K0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAe085KXo-BAtmVOjNnAd9a1szssEPnfnQ',
    appId: '1:743496744030:android:f819248530aab4cac048cf',
    messagingSenderId: '743496744030',
    projectId: 'movieapp-4fdc0',
    storageBucket: 'movieapp-4fdc0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXmG68RYWWn78xuAZoMiie8OpMtPMuZMI',
    appId: '1:743496744030:ios:24af0ddbba4f426bc048cf',
    messagingSenderId: '743496744030',
    projectId: 'movieapp-4fdc0',
    storageBucket: 'movieapp-4fdc0.appspot.com',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXmG68RYWWn78xuAZoMiie8OpMtPMuZMI',
    appId: '1:743496744030:ios:24af0ddbba4f426bc048cf',
    messagingSenderId: '743496744030',
    projectId: 'movieapp-4fdc0',
    storageBucket: 'movieapp-4fdc0.appspot.com',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDRRN64Q8B4rP3KrdwSSY0fnWgZZFiwpjc',
    appId: '1:743496744030:web:2aa2d92b13a381c6c048cf',
    messagingSenderId: '743496744030',
    projectId: 'movieapp-4fdc0',
    authDomain: 'movieapp-4fdc0.firebaseapp.com',
    storageBucket: 'movieapp-4fdc0.appspot.com',
    measurementId: 'G-8F8SNZ0CEQ',
  );

}