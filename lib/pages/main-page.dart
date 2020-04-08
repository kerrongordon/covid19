import 'package:covid19/pages/screens/general-screen.dart';
import 'package:covid19/pages/screens/home-screen.dart';
import 'package:covid19/pages/screens/infor-screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _initialPage = 1;
  final HomeScreen _homeScreen = HomeScreen();
  final GeneralScreen _generalScreen = GeneralScreen();
  final InforScreen _inforScreen = InforScreen();
  final PageController _pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  _pageChange(int page) {
    _pageController.jumpToPage(page);
    setState(() => _initialPage = page);
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
        height: 60,
        index: _initialPage,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        onTap: (val) => _pageChange(val),
        items: <Widget>[
          Icon(Icons.assessment,
              size: 30, color: Theme.of(context).primaryColor),
          Icon(Icons.home, size: 30, color: Theme.of(context).primaryColor),
          Icon(Icons.book, size: 30, color: Theme.of(context).primaryColor),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (val) => _pageChange(val),
        children: <Widget>[
          _generalScreen,
          _homeScreen,
          _inforScreen,
        ],
      ),
    );
  }
}
