import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/screens/settings/settings.country.picker.dart';
import 'package:covid19/screens/settings/settings.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    useAutomaticKeepAliveClient();
    return Scaffold(
      body: KgpBasePage(
        title: 'Settings',
        child: Column(
          children: [
            SettingsCountryPicker(),
            SettingsTheme(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CardComponent(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: const Text(
                          'About',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 20),
                      const Text(
                        'We source data from Open Disease Data, Daily updated travel advisories and The Centers for Disease Control and Prevention.',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        title: FlatButton(
                          child: Text(
                            'Open Disease Data',
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.textTheme.bodyText1.color,
                            ),
                          ),
                          onPressed: () =>
                              _launchURL(url: 'https://disease.sh/'),
                        ),
                      ),
                      ListTile(
                        title: FlatButton(
                          child: Text(
                            'Daily updated travel advisories',
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.textTheme.bodyText1.color,
                            ),
                          ),
                          onPressed: () => _launchURL(
                              url: 'https://www.travel-advisory.info/'),
                        ),
                      ),
                      ListTile(
                        title: FlatButton(
                          child: Text(
                            'Centers for Disease Control and Prevention',
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.textTheme.bodyText1.color,
                            ),
                          ),
                          onPressed: () =>
                              _launchURL(url: 'https://www.cdc.gov/'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
