import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/components/kgp-flag.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/boarding/countries-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCountryPicker extends HookWidget {
  const SettingsCountryPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = useProvider(preferencesProvider);
    final countries = useProvider(countryProvider);
    final country = useProvider(countryProviderPicker);

    final countryName = useState('');
    final ValueNotifier<List<Country>> countryImage = useState([]);

    useAutomaticKeepAliveClient();

    return country.when(
      loading: () => Center(child: KgpLoader()),
      error: (error, _) => Center(child: Text(error.toString())),
      data: (data) => _buildPickUi(
          data, context, countries, prefs, countryName, countryImage),
    );
  }

  Container _buildPickUi(
    List<Country> data,
    BuildContext context,
    AsyncValue<List<Country>> countries,
    AsyncValue<SharedPreferences> prefs,
    ValueNotifier<String> countryName,
    ValueNotifier<List<Country>> countryImage,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CardComponent(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                KgpCardTitle(
                  title: countryName.value == ''
                      ? data[0].country
                      : countryName.value,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: KgpFlag(
                    tag: null,
                    imageUrl: countryImage.value.isEmpty
                        ? data[0].countryInfo.flag
                        : countryImage.value[0].countryInfo.flag,
                    imageHeight: 200.0,
                    imageWidth: 200.0,
                  ),
                ),
              ],
            ),
            onTap: () async {
              await showSearch(
                context: context,
                delegate: CountryList(
                  data: countries.data.value,
                  perf: prefs.data.value,
                ),
              );
              String name = prefs.data.value.getString('myhomecountry');
              countryName.value = name;
              countryImage.value = countries.data.value
                  .where((element) => name == element.country)
                  .toList();

              print(countryImage.value[0].countryInfo.flag);
            },
          ),
        ],
      ),
    );
  }
}
