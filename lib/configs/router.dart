import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/anaba/presentation/anaba_details_page.dart';
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
      ),
      GoRoute(
        path: '${AnabaDetailsPage.relativePath}/:id',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AnabaDetailsPage(id: state.params['id'] ?? ''),
        ),
      ),
    ],
  );
});
