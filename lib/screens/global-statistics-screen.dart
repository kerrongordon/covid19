import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-big-card.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/global-statistics.dart';
import 'package:covid19/services/api-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class GlobalStatisticsScreen extends StatefulWidget {
  const GlobalStatisticsScreen({Key key}) : super(key: key);

  @override
  _GlobalStatisticsScreenState createState() => _GlobalStatisticsScreenState();
}

class _GlobalStatisticsScreenState extends State<GlobalStatisticsScreen>
    with AutomaticKeepAliveClientMixin<GlobalStatisticsScreen> {
  final ApiService _apiService = ApiService();
  Future<GlobalStatistics> _globalStatistics;

  @override
  void initState() {
    super.initState();
    _globalStatistics = _apiService.getGlobalStatistics();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: KgpBasePage(
        title: 'Global Statistics',
        // expandedHeight: 250,
        children: <Widget>[
          FutureBuilder(
            future: _globalStatistics,
            builder: (BuildContext context,
                AsyncSnapshot<GlobalStatistics> snapshot) {
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
                    return MainViewGS(
                      snapshot: snapshot,
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

class MainViewGS extends StatelessWidget {
  final AsyncSnapshot<GlobalStatistics> snapshot;
  const MainViewGS({
    Key key,
    this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: snapshot.data.results.length,
        itemBuilder: (BuildContext context, int i) {
          Results data = snapshot.data.results[i];
          return Container(
            child: Column(
              children: <Widget>[
                KgpBigCard(
                  title: 'Total Cases',
                  total: data.totalCases,
                  today: data.totalNewCasesToday,
                  color: Colors.orangeAccent,
                  icon: Icon(
                    Ionicons.ios_analytics,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                KgpBigCard(
                  title: 'Recovered Cases',
                  total: data.totalRecovered,
                  color: Colors.green,
                  icon: Icon(
                    Ionicons.ios_walk,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                KgpBigCard(
                  title: 'Death Cases',
                  total: data.totalDeaths,
                  today: data.totalNewDeathsToday,
                  color: Colors.redAccent,
                  icon: Icon(
                    Ionicons.ios_person_add,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                KgpBigCard(
                  title: 'Critical Cases',
                  total: data.totalSeriousCases,
                  color: Colors.blue[700],
                  icon: Icon(
                    Ionicons.ios_bed,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
