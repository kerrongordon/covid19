import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/providers/global-provider.dart';
import 'package:covid19/screens/home/components/card-chart-one.dart';
import 'package:covid19/screens/home/components/card-list-one.dart';
import 'package:covid19/utils/comma.util.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Covid 19',
        children: <Widget>[
          Consumer<GlobalProvider>(builder: (_, value, __) {
            return FutureBuilder(
              future: value.getGlobal(),
              builder: (BuildContext context, AsyncSnapshot<Global> snapshot) {
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
                      return Center(child: Text('Oh no something went wrong'));
                    } else if (!snapshot.hasData) {
                      return Center(child: Text('There seem to be a problem'));
                    } else {
                      final data = snapshot.data;
                      print(data);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            CardComponent(
                              child: Container(
                                child: Row(
                                  children: [
                                    CardChartOne(data: data),
                                    CardListOne(data: data)
                                  ],
                                ),
                              ),
                            ),
                            CardComponent(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        'Today',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Text(data.updated.toString()),
                                    SizedBox(height: 25),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    CommaUtil.use(
                                                        data.todayCases),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.orangeAccent,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Confirmed',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color:
                                                          Colors.orangeAccent,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    CommaUtil.use(
                                                        data.todayDeaths),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Deaths',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    CommaUtil.use(
                                                        data.todayRecovered),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Recovered',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
            );
          }),
        ],
      ),
    );
  }
}

// class MainViewGS extends StatelessWidget {
//   final Global data;
//   const MainViewGS({
//     Key key,
//     this.data,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Container(
//         child: Column(
//           children: <Widget>[
//             KgpBigCard(
//               title: 'Total Cases',
//               total: data?.totalConfirmed ?? 0,
//               today: data?.newConfirmed ?? 0,
//               color: Colors.orangeAccent,
//               icon: const Icon(
//                 Ionicons.ios_analytics,
//                 size: 40,
//                 color: Colors.white,
//               ),
//             ),
//             KgpBigCard(
//               title: 'Recovered Cases',
//               total: data?.totalRecovered ?? 0,
//               today: data?.newRecovered ?? 0,
//               color: Colors.green,
//               icon: const Icon(
//                 Ionicons.ios_walk,
//                 size: 40,
//                 color: Colors.white,
//               ),
//             ),
//             KgpBigCard(
//               title: 'Death Cases',
//               total: data?.totalDeaths ?? 0,
//               today: data?.newDeaths ?? 0,
//               color: Colors.redAccent,
//               icon: const Icon(
//                 Ionicons.ios_person,
//                 size: 40,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
