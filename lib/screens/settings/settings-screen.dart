import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
// import 'package:covid19/components/kgp-flag.dart';
// import 'package:covid19/models/country-model.dart';
// import 'package:covid19/providers/country-provider.dart';
// import 'package:covid19/providers/preference-provider.dart';
// import 'package:covid19/screens/boarding/countries-list.dart';
import 'package:covid19/screens/settings/color-btn.dart';
import 'package:covid19/themes/dark-theme.dart';
import 'package:covid19/themes/light-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:provider/provider.dart' as oldorivider;
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final prefs = useProvider(preferencesProvider);
    // final countries = useProvider(countryProvider);
    // final countryName = useState('');
    // final ValueNotifier<List<Country>> countryImage = useState([]);

    // String name = prefs.data.value.getString('myhomecountry');

    // useMemoized(() => countryImage.value = countries.data.value
    //     .where((element) => name == element.country)
    //     .toList());

    return Scaffold(
      body: KgpBasePage(
        title: 'Settings',
        children: [
          // countryImage.value.isEmpty
          //     ? Container()
          //     : Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20),
          //         child: CardComponent(
          //           padding: const EdgeInsets.all(20),
          //           onTap: () async {
          //             await showSearch(
          //               context: context,
          //               delegate: CountryList(
          //                 data: countries.data.value,
          //                 perf: prefs.data.value,
          //               ),
          //             );
          //             String name = prefs.data.value.getString('myhomecountry');
          //             countryName.value = name;
          //             countryImage.value = countries.data.value
          //                 .where((element) => name == element.country)
          //                 .toList();
          //           },
          //           child: Row(
          //             children: [
          //               KgpFlag(
          //                 tag: 'home',
          //                 imageUrl: countryImage.value[0].countryInfo.flag,
          //                 imageHeight: 70.0,
          //                 imageWidth: 70.0,
          //               ),
          //               Spacer(),
          //               Text(
          //                 'Change Country',
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   color: Theme.of(context).textTheme.bodyText1.color,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
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
                      'We source data from Open Disease Data, Daily updated travel advisories and The Centers for Disease Control and Prevention.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: FlatButton(
                        child: Text(
                          'Open Disease Data',
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                        onPressed: () => _launchURL(url: 'https://disease.sh/'),
                      ),
                    ),
                    ListTile(
                      title: FlatButton(
                        child: Text(
                          'Daily updated travel advisories',
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).textTheme.bodyText1.color,
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
                            color: Theme.of(context).textTheme.bodyText1.color,
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
