import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';

class KgpCenter extends StatelessWidget {
  final Widget child;
  const KgpCenter({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(children: [Center(child: child)]),
    );
  }
}
