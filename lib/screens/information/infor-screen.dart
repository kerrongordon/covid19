import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/screens/information/infor-list.dart';
import 'package:covid19/translations/infor-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InforScreen extends HookWidget {
  const InforScreen();

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAliveClient();

    return Scaffold(
      body: KgpBasePage(
        title: pagetitle,
        expandedHeight: 55,
        child: Container(
          child: InforList(),
        ),
      ),
    );
  }
}
