import 'package:covid19/pages/screens/infor-screen.dart';
import 'package:covid19/screens/country-statistics-screen.dart';
import 'package:covid19/screens/global-statistics-screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static int _initialPage = 1;

  final InforScreen _inforScreen = InforScreen();
  final GlobalStatisticsScreen _globalStatisticsScreen =
      GlobalStatisticsScreen();
  final CountryStatisticsScreen _countryStatisticsScreen =
      CountryStatisticsScreen();

  final PageController _pageController = PageController(
    initialPage: _initialPage,
    keepPage: true,
  );

  _pageChange(int page) {
    setState(() {
      _pageController.jumpToPage(page);
      _initialPage = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).cardTheme.color.withOpacity(0.98),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Theme.of(context).cardTheme.color,
        height: 50,
        index: _initialPage,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.linear,
        onTap: (val) => _pageChange(val),
        items: <Widget>[
          Icon(Ionicons.ios_globe, color: Theme.of(context).primaryColor),
          Icon(Ionicons.ios_home, color: Theme.of(context).primaryColor),
          Icon(Ionicons.ios_book, color: Theme.of(context).primaryColor),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (val) {
          setState(() => _initialPage = val);
          // _pageChange(val);
        },
        children: <Widget>[
          _countryStatisticsScreen,
          _globalStatisticsScreen,
          _inforScreen,
        ],
      ),
    );
  }
}
