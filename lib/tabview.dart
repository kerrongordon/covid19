// // import 'package:covid19/screens/country-statistics-screen.dart';
// import 'package:covid19/screens/home/home-screen.dart';
// import 'package:covid19/screens/infor-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:motion_tab_bar/MotionTabBarView.dart';
// import 'package:motion_tab_bar/MotionTabController.dart';
// import 'package:motion_tab_bar/motiontabbar.dart';

// class TabView extends StatefulWidget {
//   TabView({Key key}) : super(key: key);

//   @override
//   _TabViewState createState() => _TabViewState();
// }

// class _TabViewState extends State<TabView> with TickerProviderStateMixin {
//   MotionTabController _tabController;

//   final HomeScreen homeScreen = HomeScreen();
//   final InforScreen inforScreen = InforScreen();
//   // final CountryStatisticsScreen countryStatisticsScreen =
//   //     CountryStatisticsScreen();

//   @override
//   void initState() {
//     super.initState();
//     _tabController = MotionTabController(initialIndex: 1, vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: MotionTabBar(
//           labels: ["Account", "Global", "Dashboard"],
//           initialSelectedTab: "Global",
//           tabIconColor: Theme.of(context).primaryColor,
//           tabSelectedColor: Theme.of(context).primaryColor,
//           onTabItemSelected: (int value) {
//             setState(() {
//               _tabController.index = value;
//             });
//           },
//           icons: [Icons.account_box, Ionicons.ios_analytics, Icons.menu],
//           textStyle:
//               TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
//         ),
//         body: MotionTabBarView(
//           controller: _tabController,
//           children: <Widget>[
//             // countryStatisticsScreen,
//             Container(),
//             homeScreen,
//             inforScreen,
//           ],
//         ));
//   }
// }
