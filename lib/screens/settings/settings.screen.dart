import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/screens/settings/settings.country.picker.dart';
import 'package:covid19/screens/settings/settings.theme.dart';
import 'package:covid19/translations/setting-translate.dart';
import 'package:covid19/translations/tab-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appName = useState('');
    final appVersion = useState('');
    useAutomaticKeepAliveClient();

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      appName.value = packageInfo.appName;
      appVersion.value = packageInfo.version;
    });

    return Scaffold(
      body: KgpBasePage(
        title: settings,
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
                        child: Text(
                          abouttitle,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/appicon.png',
                              width: 120.0,
                              height: 120.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        appName.value,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(appVersion.value),
                      const SizedBox(height: 20),
                      Text(
                        aboutinfo,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
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
