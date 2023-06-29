import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'configs/flavor.dart';
import 'features/anaba/model/anaba.dart';
import 'features/stripe/stripe_repository.dart';
import 'features/user/model/app_user.dart';

class P {
  P._();

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

  static final googleSignInProvider = Provider(
    (_) => GoogleSignIn(
      clientId: isDevMode
          ? '650202335339-j1l3u9rkhkam136odbgk6rul86hlts7e.apps.googleusercontent.com'
          : '746969617059-vgrlq8ajjgh0fscavu0rc12esju8mqga.apps.googleusercontent.com',
    ),
  );

  /// userのemailをドキュメントに追加する
  static final createUserProvider = Provider(
    (ref) => () async {
      final user = await ref.watch(userProvider.future);
      if (user != null) {
        final appUser = await ref.read((appUserProvider(user.uid)).future);
        if (appUser.data() == null) {
          await appUser.reference
              .set(AppUser(email: ref.watch(userProvider).valueOrNull?.email));
        }
      }
    },
  );

  static final signInProvider = Provider((ref) {
    return () async {
      // Trigger the authentication flow
      final googleUser = await ref.watch(googleSignInProvider).signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await ref.watch(createUserProvider).call();
      return userCredential;
    };
  });

  static final signOutProvider = Provider((ref) {
    return () async {
      await ref.watch(googleSignInProvider).signOut();
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

  static final firebaseFirestoreProvider = Provider(
    (_) => FirebaseFirestore.instance,
  );
  static final firebaseAuthProvider = Provider((_) => FirebaseAuth.instance);

  static final appUserProvider =
      StreamProvider.autoDispose.family((ref, String? uid) {
    final reference = ref
        .watch(firebaseFirestoreProvider)
        .collection('users')
        .doc(uid)
        .withConverter(
          fromFirestore: (ds, _) =>
              ds.data() == null ? null : AppUser.fromJson(ds.data()!),
          toFirestore: (value, _) => value?.toJson() ?? {},
        );
    return reference.snapshots();
  });

  static final anabaRefProvider = Provider(
    (ref) =>
        ref.read(P.firebaseFirestoreProvider).collection('anaba').withConverter(
              fromFirestore: (ds, _) => Anaba.fromJson(ds.data()!),
              toFirestore: (value, _) => value.toJson(),
            ),
  );

  static final anabaListProvider = StreamProvider(
    (ref) => ref
        .watch(anabaRefProvider)
        .orderBy('createdAt', descending: true)
        .snapshots(),
  );

  static final anabaProvider = Provider.family(
    (ref, String id) => ref
        .watch(anabaListProvider)
        .valueOrNull
        ?.docs
        .firstWhere((e) => e.reference.id == id),
  );
}
