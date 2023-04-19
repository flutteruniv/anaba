import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignInProvider = Provider((ref) => GoogleSignIn());
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

final userProvider = StreamProvider(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
);

final uidProvider = Provider((ref) => ref.watch(userProvider).valueOrNull?.uid);

final isSignedInProvider = Provider(
  (ref) => ref.watch(userProvider).valueOrNull != null,
);

final signInProvider = Provider((ref) {
  return () async {
    final googleProvider = GoogleAuthProvider();

    final userCredential = await ref.read(firebaseAuthProvider).signInWithPopup(
          googleProvider,
        );
    return userCredential;
  };
});

final signOutProvider = Provider((ref) {
  return () async {
    await ref.read(googleSignInProvider).signOut();
    await ref.read(firebaseAuthProvider).signOut();
  };
});
