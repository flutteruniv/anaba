import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/stripe/stripe_repository.dart';

class P {
  /// StripeのAccountを作成するURLを作成する
  static final stripeAccountUrlProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(stripeRepository).createStripeAccount(),
  );

  /// ダッシュボードにアクセスするためのURLを作成する
  static final stripeLoginUrlProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(stripeRepository).createStripeLoginLink(),
  );

  /// FirebaseAuthでログイン中のUser情報
  static final userProvider = StreamProvider(
    (ref) => ref.watch(_firebaseAuthProvider).authStateChanges(),
  );

  /// ユーザーがログイン済みかどうか
  static final isSignedInProvider = Provider(
    (ref) => ref.watch(userProvider).valueOrNull != null,
  );

  static final signInProvider = Provider((ref) {
    return () async {
      final googleProvider = GoogleAuthProvider();

      final userCredential =
          await ref.read(_firebaseAuthProvider).signInWithPopup(
                googleProvider,
              );
      return userCredential;
    };
  });

  static final signOutProvider = Provider((ref) {
    return () async {
      await ref.read(_googleSignInProvider).signOut();
      await ref.read(_firebaseAuthProvider).signOut();
    };
  });

  static final _functionsProvider = Provider(
    (_) => FirebaseFunctions.instanceFor(
      region: 'asia-northeast1',
    ),
  );

  static final stripeRepository = Provider(
    (ref) => StripeRepository(
      firebaseFunctions: ref.watch(_functionsProvider),
    ),
  );

  static final _googleSignInProvider = Provider((_) => GoogleSignIn());
  static final _firebaseAuthProvider = Provider((_) => FirebaseAuth.instance);
}
