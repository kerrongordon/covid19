import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Settings',
        background: Icon(
          Ionicons.ios_cog,
          size: 200,
          color: Theme.of(context).accentColor,
        ),
        children: [
          Center(
            child: Text('Coming Soon'),
          ),
        ],
      ),
    );
  }
}
