
<<<<<<< HEAD
import 'configs/flavor.dart';

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = isDevMode
      ? FirebaseOptions(
          apiKey: 'AIzaSyDP7Jg1EUQB20LDj7OSvqYCz0CNeZNla-s',
          appId: '1:650202335339:web:e1900fbaec9d2bed78c92e',
          messagingSenderId: '650202335339',
          projectId: 'anaba-dev',
          authDomain: 'anaba-dev.firebaseapp.com',
          storageBucket: 'anaba-dev.appspot.com',
          measurementId: 'G-LGWN80QMWJ',
        )
      : FirebaseOptions(
          apiKey: 'AIzaSyA4ubTDP2ODjssKN7bdxSE4Ctv3KAWxIv0',
          appId: '1:746969617059:web:9af5f8730b7800764ee516',
          messagingSenderId: '746969617059',
          projectId: 'anaba-prod',
          authDomain: 'anaba.app',
          storageBucket: 'anaba-prod.appspot.com',
          measurementId: 'G-HK2EQZ8W40',
        );
}
=======
>>>>>>> 64e8504 (“コミットテスト”)
