import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/screens/settings/color-btn.dart';
import 'package:covid19/themes/dark-theme.dart';
import 'package:covid19/themes/light-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:link/link.dart';

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
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 20),
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
                          fillColor: Colors.blueGrey[600],
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CardComponent(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'About',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 20),
                    Text(
                      'We source data from Open Disease Data and Daily updated travel advisories.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(
                        Ionicons.ios_arrow_forward,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Link(
                        url: 'https://disease.sh/',
                        child: Text(
                          'Open Disease Data',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Ionicons.ios_arrow_forward,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Link(
                        url: 'https://www.travel-advisory.info/',
                        child: Text(
                          'Daily updated travel advisories',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                      ),
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
