import 'package:covid19/components/kgp-blur.dart';
import 'package:covid19/screens/tab/providers/tab-provider.dart';
import 'package:covid19/screens/tab/tab-bottom-bar.dart';
import 'package:covid19/screens/countries/countries-screen.dart';
import 'package:covid19/screens/global/global-screen.dart';
import 'package:covid19/screens/information/infor-screen.dart';
import 'package:covid19/screens/main/main-screen.dart';
import 'package:covid19/screens/settings/settings.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabScreen extends HookWidget {
  TabScreen({Key key}) : super(key: key);

  final MainScreen _mainScreen = MainScreen();
  final GlobalScreen _homeScreen = GlobalScreen();
  final InforScreen _inforScreen = const InforScreen();
  final SettingsScreen _settingsScreen = SettingsScreen();
  final CountriesScreen _countriesScreen = CountriesScreen();

  @override
  Widget build(BuildContext context) {
    final _pageIndex = useProvider(tabProvider);
    final _pageController = usePageController(initialPage: 2);
    void onPageChange(int index) => _pageIndex.changePages(index);
    void onTapIcon(int index) => _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linear,
        );

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChange,
        children: [
          _homeScreen,
          _countriesScreen,
          _mainScreen,
          _inforScreen,
          _settingsScreen,
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          KgpBlur(),
          Consumer(
            builder: (context, watch, __) {
              final page = watch(tabProvider.state);
              return TabBottomBar(
                pageIndex: page,
                onItemSelected: onTapIcon,
              );
            },
          ),
        ],
      ),
    );
  }
}
