// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'configs/flavor.dart';
import 'configs/router.dart';
import 'configs/theme.dart';
import 'firebase_options.dart';
import 'providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Google Sign In を FLAVOR で分けるための処理
  final meta = html.MetaElement()
    ..name = 'google-signin-client_id'
    ..content = isDevMode
        ? '650202335339-j1l3u9rkhkam136odbgk6rul86hlts7e.apps.googleusercontent.com'
        : '746969617059-vgrlq8ajjgh0fscavu0rc12esju8mqga.apps.googleusercontent.com';
  html.document.head?.append(meta);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAnalytics.instance.logEvent(
    name: 'app_start',
  );

  usePathUrlStrategy();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(P.createUserProvider).call();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ref.watch(themeProvider),
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      locale: const Locale('ja'),
    );
  }
}
