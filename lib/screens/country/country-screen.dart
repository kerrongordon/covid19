import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        children: [
          Center(
            child: Text('Coming Soon'),
          )
        ],
      ),
    );
  }
}
