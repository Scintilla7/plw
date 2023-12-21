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

      case TargetPlatform.windows:

        throw UnsupportedError(

          'DefaultFirebaseOptions have not been configured for windows - '

          'you can reconfigure this by running the FlutterFire CLI again.',

        );

      default:

        throw UnsupportedError(

          'DefaultFirebaseOptions are not supported for this platform.',

        );

    }

  }


  static const FirebaseOptions web = FirebaseOptions(

    apiKey: 'AIzaSyCEVyE7rBymnHQ5rpXBack13qoLtUaEpl0',

    appId: '1:142180136648:web:596b385d8152fb935b17fd',

    messagingSenderId: '142180136648',

    projectId: 'pwldatabase',

    authDomain: 'pwldatabase.firebaseapp.com',

    storageBucket: 'gs://pwldatabase.appspot.com',

  );


  static const FirebaseOptions android = FirebaseOptions(

    apiKey: 'AIzaSyCEVyE7rBymnHQ5rpXBack13qoLtUaEpl0',

    appId: '1:142180136648:android:dedd2178588e34c15b17fd',

    messagingSenderId: '142180136648',

    projectId: 'pwldatabase',

    storageBucket: 'gs://pwldatabase.appspot.com',

  );

}
