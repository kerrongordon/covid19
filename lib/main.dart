import 'package:covid19/themes/app-theme.dart';
import 'package:covid19/translations/input-translate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:hooks_riverpod/hooks_riverpod.dart';

FirebaseAnalytics analytics;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  analytics = FirebaseAnalytics();
  await dot_env.load();

  runApp(
    EasyLocalization(
      supportedLocales: appLocaleList,
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: const ProviderScope(
        child: AppTheme(),
      ),
    ),
  );
}
