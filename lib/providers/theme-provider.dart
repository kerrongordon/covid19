import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = FutureProvider(
  (_) async => AdaptiveTheme.getThemeMode(),
);
