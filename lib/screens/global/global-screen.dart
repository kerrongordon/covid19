import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/providers/global-provider.dart';
import 'package:covid19/screens/global/global-card-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlobalScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final config = useProvider(globalProvider);
    return Scaffold(
      body: KgpBasePage(
        title: 'Global',
        background: Image.asset('assets/earth.png'),
        children: [
          config.when(
            data: (data) => GlobalCardList(data: data),
            loading: () => KgpLoader(),
            error: (error, st) => Center(child: Text(error.toString())),
          ),
        ],
      ),
    );
  }
}
