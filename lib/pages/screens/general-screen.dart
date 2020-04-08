import 'package:covid19/components/home-card-item.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/general-stats.dart';
import 'package:covid19/services/api-data-service.dart';
import 'package:covid19/services/general-stats-service.dart';
import 'package:flutter/material.dart';

class GeneralScreen extends StatefulWidget {
  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen>
    with AutomaticKeepAliveClientMixin<GeneralScreen> {
  final GeneralStatsService generalStatsService = GeneralStatsService();

  final ApiDataService apiDataService = ApiDataService();
  Future<GeneralStats> _getGeneralStats;

  @override
  void initState() {
    super.initState();
    _getGeneralStats = generalStatsService.getGeneralStats();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return KgpBasePage(
      title: 'Global Cases',
      children: <Widget>[
        FutureBuilder<GeneralStats>(
          future: _getGeneralStats,
          builder:
              (BuildContext context, AsyncSnapshot<GeneralStats> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                GeneralStats data = snapshot.data;

                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        HomeCardItem(
                          title: 'Total Cases',
                          hasGlass: true,
                          position: 1,
                          value: data.data.totalCases,
                          color: Colors.orangeAccent,
                        ),
                        HomeCardItem(
                          title: 'Recovery Cases',
                          hasGlass: true,
                          position: 2,
                          value: data.data.recoveryCases,
                          color: Colors.green,
                        ),
                        HomeCardItem(
                          title: 'Death Cases',
                          hasGlass: true,
                          position: 3,
                          value: data.data.deathCases,
                          color: Colors.redAccent,
                        ),
                        Divider(
                          height: 150,
                        ),
                        HomeCardItem(
                          title: 'Currently Infected',
                          fontSizetitle: 15,
                          fontSizetrailing: 20,
                          verticalPad: 3,
                          space: 5,
                          position: 4,
                          value: data.data.currentlyInfected,
                          color: Colors.blue[800],
                        ),
                        HomeCardItem(
                          title: 'Cases With Outcome',
                          fontSizetitle: 15,
                          fontSizetrailing: 20,
                          verticalPad: 3,
                          space: 5,
                          position: 5,
                          value: data.data.casesWithOutcome,
                          color: Colors.blue[800],
                        ),
                        HomeCardItem(
                          title: 'Mild Condition Active Cases',
                          fontSizetitle: 15,
                          fontSizetrailing: 20,
                          verticalPad: 3,
                          space: 5,
                          position: 6,
                          value: data.data.mildConditionActiveCases,
                          color: Colors.blue[800],
                        ),
                        HomeCardItem(
                          title: 'Critical Condition Active Cases',
                          fontSizetitle: 15,
                          fontSizetrailing: 20,
                          verticalPad: 3,
                          space: 5,
                          position: 7,
                          value: data.data.criticalConditionActiveCases,
                          color: Colors.blue[800],
                        ),
                        HomeCardItem(
                          title: 'Recovered Closed Cases',
                          fontSizetitle: 15,
                          fontSizetrailing: 20,
                          verticalPad: 3,
                          space: 5,
                          position: 8,
                          value: data.data.recoveredClosedCases,
                          color: Colors.blue[800],
                        ),
                        HomeCardItem(
                          title: 'Death Closed Cases',
                          fontSizetitle: 15,
                          fontSizetrailing: 20,
                          verticalPad: 3,
                          space: 5,
                          position: 9,
                          value: data.data.deathClosedCases,
                          color: Colors.blue[800],
                        ),
                        HomeCardItem(
                          title: 'Death Closed Cases',
                          fontSizetitle: 15,
                          fontSizetrailing: 20,
                          verticalPad: 3,
                          space: 5,
                          position: 10,
                          value: data.data.deathClosedCases,
                          color: Colors.blue[800],
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: <Widget>[
                            Text('Last updated'),
                            Text(data.data.lastUpdate),
                          ],
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                );
              }
            }

            return Container(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ],
    );
  }
}
