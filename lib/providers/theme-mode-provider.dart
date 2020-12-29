import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeModeProvider = FutureProvider.autoDispose((ref) async {
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  return savedThemeMode;
});
