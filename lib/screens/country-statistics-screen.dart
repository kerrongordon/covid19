import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/components/kgp-text-form.dart';
import 'package:covid19/models/countries-all.dart';
import 'package:covid19/pages/country-page.dart';
import 'package:covid19/services/api-service.dart';
import 'package:covid19/utils/util.dart';
import 'package:flutter/material.dart';

class CountryStatisticsScreen extends StatefulWidget {
  @override
  _CountryStatisticsScreenState createState() =>
      _CountryStatisticsScreenState();
}

class _CountryStatisticsScreenState extends State<CountryStatisticsScreen>
    with AutomaticKeepAliveClientMixin<CountryStatisticsScreen> {
  final ApiService _apiService = ApiService();
  Future<List<Country>> _getCountryStatistics;
  List<Country> _countriesFilter = [];
  List<Country> _snapdata;

  TextEditingController _search = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _getCountryStatistics = _apiService.getAllCountries();
    loaddata();
  }

  loaddata() {
    return _getCountryStatistics.then((data) {
      data.sort((a, b) => b.totalConfirmed - a.totalConfirmed);
      List<Country> srmoveZero =
          data.where((co) => co.totalConfirmed > 0).toList();
      _countriesFilter = srmoveZero;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: KgpBasePage(
        title: 'Countries',
        expandedHeight: 50,
        persistentHeader: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: KgpTextForm(
            controller: _search,
            focusNode: _focusNode,
            keyboardType: TextInputType.text,
            labelText: 'Search Country Name',
            onChanged: (val) {
              setState(() {
                _countriesFilter = _snapdata
                    .where((names) =>
                        names.country.toLowerCase().contains(val.toLowerCase()))
                    .where((co) => co.totalConfirmed > 0)
                    .toList();
              });
            },
            prefixIcon: Icon(Icons.search),
          ),
        ),
        children: <Widget>[
          FutureBuilder(
            future: _getCountryStatistics,
            builder:
                (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
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
                    _snapdata = snapshot.data;
                    return Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.31,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _countriesFilter.length,
                          itemBuilder: (BuildContext context, int i) {
                            final data = _countriesFilter[i];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ListTile(
                                leading: CachedNetworkImage(
                                  imageUrl:
                                      'https://www.countryflags.io/${data.countryCode}/flat/64.png',
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    child: CircularProgressIndicator(),
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                title: Text(
                                  data.country,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).textTheme.body1.color,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: Text(
                                  numberCommas(data.totalConfirmed),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).textTheme.body1.color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                onTap: () {
                                  _focusNode.unfocus();
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CountryPage(
                                                data: data,
                                              )))
                                      .then((d) {
                                    _search.clear();

                                    setState(() {
                                      loaddata();
                                    });
                                  });
                                },
                              ),
                            );
                          },
                        ),
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
