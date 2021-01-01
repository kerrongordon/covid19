import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/providers/global-provider.dart';
import 'package:covid19/screens/global/global-card-list.dart';
import 'package:covid19/translations/app-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlobalScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final global = useProvider(globalProvider);
    useAutomaticKeepAliveClient();
    return Scaffold(
      body: KgpBasePage(
        title: worldwide,
        background: Image.asset('assets/earth.png'),
        child: global.when(
          data: (data) => GlobalCardList(data: data),
          loading: () => const KgpLoader(),
          error: (error, _) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
