import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/stripe/stripe_repository.dart';
import 'features/user/model/app_user.dart';

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
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
  );

  /// ユーザーがログイン済みかどうか
  static final isSignedInProvider = Provider(
    (ref) => ref.watch(userProvider).valueOrNull != null,
  );

  static final signInProvider = Provider((ref) {
    return () async {
      final googleProvider = GoogleAuthProvider();

      final userCredential =
          await ref.read(firebaseAuthProvider).signInWithPopup(
                googleProvider,
              );

      return userCredential;
    };
  });

  static final signOutProvider = Provider((ref) {
    return () async {
      await ref.read(firebaseAuthProvider).signOut();
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

  static final userReference = Provider(
    (ref) =>
        ref.watch(firebaseFirestoreProvider).collection('users').withConverter(
              fromFirestore: (ds, _) => AppUser.fromJson(ds.data()!),
              toFirestore: (data, _) => data.toJson(),
            ),
  );

  static final firebaseFirestoreProvider =
      Provider((_) => FirebaseFirestore.instance);
  static final firebaseAuthProvider = Provider((_) => FirebaseAuth.instance);
}
