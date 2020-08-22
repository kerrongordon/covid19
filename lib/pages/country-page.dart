// import 'package:covid19/components/kgp-base-page.dart';
// import 'package:covid19/components/kgp-big-card.dart';
// import 'package:covid19/models/countries-all.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

// class CountryPage extends StatelessWidget {
//   final Country data;

//   const CountryPage({Key key, this.data}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: KgpBasePage(
//         expandedHeight: 50,
//         title: data.country,
//         children: <Widget>[
//           SizedBox(height: 50),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: KgpBigCard(
//               title: 'Cases',
//               total: data.totalConfirmed,
//               today: data.newConfirmed,
//               color: Colors.orangeAccent,
//               icon: Icon(
//                 Ionicons.ios_analytics,
//                 size: 40,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: KgpBigCard(
//               title: 'Recovered',
//               total: data.totalRecovered,
//               today: data.newRecovered,
//               color: Colors.green,
//               icon: Icon(
//                 Ionicons.ios_walk,
//                 size: 40,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: KgpBigCard(
//               title: 'Death',
//               total: data.totalDeaths,
//               today: data.newDeaths,
//               color: Colors.redAccent,
//               icon: Icon(
//                 Ionicons.ios_person_add,
//                 size: 40,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 20),
//           //   child: KgpBigCard(
//           //     title: 'Critical',
//           //     total: data.critical,
//           //     color: Colors.blue[700],
//           //     icon: Icon(
//           //       Ionicons.ios_bed,
//           //       size: 40,
//           //       color: Colors.white,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
