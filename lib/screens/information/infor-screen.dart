import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/providers/covid-infor-provider.dart';
import 'package:covid19/screens/information/infor-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InforScreen extends HookWidget {
  const InforScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final infor = useProvider(covidInforProvider);
    useAutomaticKeepAliveClient();

    return Scaffold(
      body: KgpBasePage(
        title: 'Protect Yourself & Others',
        expandedHeight: 55,
        child: Container(
          child: infor.when(
            data: (data) => InforList(data: data),
            loading: () => const KgpLoader(),
            error: (error, _) => Center(child: Text(error.toString())),
          ),
        ),
      ),
    );
  }
}
