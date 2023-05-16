
<<<<<<< HEAD
import '../features/anaba_form/anaba_form_page.dart';
import '../features/home/presentation/home_page.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    observers: [
      FirebaseAnalyticsObserver(
        analytics: FirebaseAnalytics.instance,
      ),
    ],
    routes: [
      GoRoute(
        path: HomePage.relativePath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: AnabaFormPage.relativePath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AnabaFormPage(),
        ),
      )
    ],
  );
});
=======
>>>>>>> 64e8504 (“コミットテスト”)
