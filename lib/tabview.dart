import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covid19/screens/countries/countries-screen.dart';
import 'package:covid19/screens/home/home-screen.dart';
import 'package:covid19/screens/information/infor-screen.dart';
import 'package:covid19/screens/settings/settings-screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  TabView({Key key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int _currentIndex = 0;
  PageController _pageController;

  final HomeScreen _homeScreen = HomeScreen();
  final CountriesScreen _countriesScreen = CountriesScreen();
  final InforScreen _inforScreen = InforScreen();
  final SettingsScreen _settingsScreen = SettingsScreen();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
            _inforScreen,
            _settingsScreen,
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
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Global'),
            icon: Icon(Ionicons.ios_analytics),
            textAlign: TextAlign.center,
            activeColor: Theme.of(context).accentColor,
          ),
          BottomNavyBarItem(
            title: Text('Countries'),
            icon: Icon(Ionicons.ios_trending_up),
            textAlign: TextAlign.center,
            activeColor: Theme.of(context).accentColor,
          ),
          BottomNavyBarItem(
            title: Text('Info'),
            icon: Icon(Ionicons.ios_apps),
            textAlign: TextAlign.center,
            activeColor: Theme.of(context).accentColor,
          ),
          BottomNavyBarItem(
            title: Text('Settings'),
            icon: Icon(Ionicons.ios_cog),
            textAlign: TextAlign.center,
            activeColor: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
