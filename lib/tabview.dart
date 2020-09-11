import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covid19/screens/countries/countries-screen.dart';
import 'package:covid19/screens/home/home-screen.dart';
import 'package:covid19/screens/information/infor-screen.dart';
import 'package:covid19/screens/main/main-screen.dart';
import 'package:covid19/screens/vaccine/vaccine-screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  TabView({Key key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int _currentIndex = 2;
  PageController _pageController;

  final HomeScreen _homeScreen = HomeScreen();
  final CountriesScreen _countriesScreen = CountriesScreen();
  final InforScreen _inforScreen = InforScreen();
  final VaccineScreen _vaccineScreen = VaccineScreen();
  final MainScreen _mainScreen = MainScreen();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            _homeScreen,
            _countriesScreen,
            _mainScreen,
            _inforScreen,
            _vaccineScreen,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Theme.of(context).cardTheme.color,
        selectedIndex: _currentIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        curve: Curves.linear,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Global'),
            textAlign: TextAlign.center,
            icon: Icon(Ionicons.ios_analytics),
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Theme.of(context).textTheme.bodyText1.color,
          ),
          BottomNavyBarItem(
            title: Text('Countries'),
            textAlign: TextAlign.center,
            icon: Icon(Ionicons.ios_trending_up),
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Theme.of(context).textTheme.bodyText1.color,
          ),
          BottomNavyBarItem(
            title: Text('Home'),
            textAlign: TextAlign.center,
            icon: Icon(Ionicons.ios_pin),
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Theme.of(context).textTheme.bodyText1.color,
          ),
          BottomNavyBarItem(
            title: Text('Info'),
            textAlign: TextAlign.center,
            icon: Icon(Ionicons.ios_apps),
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Theme.of(context).textTheme.bodyText1.color,
          ),
          BottomNavyBarItem(
            title: Text('Vaccine'),
            textAlign: TextAlign.center,
            icon: Icon(Ionicons.ios_book),
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Theme.of(context).textTheme.bodyText1.color,
          ),
        ],
      ),
    );
  }
}
