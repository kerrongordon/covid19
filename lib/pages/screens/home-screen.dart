import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-text-form.dart';
import 'package:covid19/models/summary-model.dart';
import 'package:covid19/pages/country-page.dart';
import 'package:covid19/services/api-data-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  final ApiDataService _apiDataService = ApiDataService();

  Future<SummaryModel> _getSummary;
  List<Countries> _countriesFilter;

  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getSummary = _apiDataService.getSummary();
    _getSummary.then((data) => _countriesFilter =
        data.countries.where((doc) => doc.totalConfirmed > 0).toList());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: FutureBuilder(
        future: _getSummary,
        builder: (BuildContext context, AsyncSnapshot<SummaryModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              SummaryModel data = snapshot.data;
              return KgpBasePage(
                title: 'Countries',
                expandedHeight: 50,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: KgpTextForm(
                      controller: _search,
                      keyboardType: TextInputType.text,
                      labelText: 'Search Country Name',
                      onChanged: (val) {
                        setState(() {
                          _countriesFilter = data.countries
                              .where((names) => names.country
                                  .toLowerCase()
                                  .contains(val.toLowerCase()))
                              .where((doc) => doc.totalConfirmed > 0)
                              .toList();
                        });
                      },
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 190,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _countriesFilter.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color:
                                      Colors.deepPurpleAccent.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Card(
                              color: Colors.deepPurpleAccent,
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return CountryPage(
                                            data: _countriesFilter[i]);
                                      },
                                    ),
                                  ).then((onValue) {
                                    _search.clear();
                                    setState(() {
                                      _getSummary.then((data) =>
                                          _countriesFilter = data.countries
                                              .where((doc) =>
                                                  doc.totalConfirmed > 0)
                                              .toList());
                                    });
                                  });
                                },
                                leading: CachedNetworkImage(
                                  imageUrl:
                                      'https://www.countryflags.io/${_countriesFilter[i].countryCode}/flat/32.png',
                                ),
                                title: Text(
                                  _countriesFilter[i].country,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Text(
                                  _countriesFilter[i].totalConfirmed.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 400),
                ],
              );
            }
          }
          return KgpBasePage(
            title: 'Loading...',
            children: <Widget>[
              Container(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
