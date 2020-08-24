import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/screens/settings/color-btn.dart';
import 'package:covid19/themes/dark-theme.dart';
import 'package:covid19/themes/light-theme.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CardComponent(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Appearance',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        ColorBtn(
                          title: 'Light',
                          fillColor: LightTheme.lightBackground,
                          onPressed: () {
                            AdaptiveTheme.of(context).setLight();
                          },
                        ),
                        ColorBtn(
                          title: 'Dark',
                          fillColor: DarkTheme.darkBackground,
                          onPressed: () {
                            AdaptiveTheme.of(context).setDark();
                          },
                        ),
                        ColorBtn(
                          title: 'Auto',
                          fillColor: Colors.blueGrey[800],
                          onPressed: () {
                            AdaptiveTheme.of(context).setSystem();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
