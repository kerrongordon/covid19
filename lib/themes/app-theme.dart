import 'package:covid19/app.dart';
import 'package:covid19/providers/theme-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class AppTheme extends HookWidget {
  const AppTheme();

  @override
  Widget build(BuildContext context) {
    final themeSetting = useProvider(themeProvider);
    return themeSetting.when(
      data: (data) => MyApp(savedThemeMode: data),
      loading: () => Container(),
      error: (_, __) => Container(),
    );
  }
}
