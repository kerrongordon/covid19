import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/components/kgp-text-form.dart';
import 'package:covid19/models/country-statistics.dart';
import 'package:covid19/services/api-country.dart';
import 'package:covid19/utils/util.dart';
import 'package:flutter/material.dart';

class CountryStatisticsScreen extends StatefulWidget {
  @override
  _CountryStatisticsScreenState createState() =>
      _CountryStatisticsScreenState();
}

class _CountryStatisticsScreenState extends State<CountryStatisticsScreen>
    with AutomaticKeepAliveClientMixin<CountryStatisticsScreen> {
  final ApiCountry _apiService = ApiCountry();
  Future<List<CountryStatistics>> _getCountryStatistics;

  @override
  void initState() {
    super.initState();
    _getCountryStatistics = _apiService.getCountryStatistics();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: KgpBasePage(
        title: 'Countries',
        persistentHeader: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: KgpTextForm(
            // controller: _search,
            keyboardType: TextInputType.text,
            labelText: 'Search Country Name',
            onChanged: (val) {
              // setState(() {
              //   _countriesFilter = data.countries
              //       .where((names) => names.country
              //           .toLowerCase()
              //           .contains(val.toLowerCase()))
              //       .where((doc) => doc.totalConfirmed > 0)
              //       .toList();
              // });
            },
            prefixIcon: Icon(Icons.search),
          ),
        ),
        children: <Widget>[
          FutureBuilder(
            future: _getCountryStatistics,
            builder: (BuildContext context,
                AsyncSnapshot<List<CountryStatistics>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Container();
                  break;
                case ConnectionState.waiting:
                  return KgpLoader();
                  break;
                case ConnectionState.active:
                  return KgpLoader();
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Oh no something went wrong');
                  } else if (!snapshot.hasData) {
                    return Text('There seem to be a problem');
                  } else {
                    final snap = snapshot.data;
                    return Container(
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            // physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: snap.length,
                            itemBuilder: (BuildContext context, int i) {
                              final data = snap[i];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Card(
                                  elevation: 15,
                                  // color: Colors.blue[800],
                                  margin: const EdgeInsets.only(bottom: 30),
                                  child: ListTile(
                                    leading: CachedNetworkImage(
                                      imageUrl:
                                          'https://www.countryflags.io/${data.countryInfo.iso2}/flat/32.png',
                                    ),
                                    title: Text(
                                      data.country,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .color,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    trailing: Text(
                                      numberCommas(data.cases),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .color,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  break;
                default:
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
