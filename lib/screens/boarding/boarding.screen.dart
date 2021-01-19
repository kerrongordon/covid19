import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/search/kgp-search.dart';
import 'package:covid19/configs/data.config.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/home-provider.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:covid19/screens/boarding/boarding.bottom.nav.dart';
import 'package:covid19/screens/boarding/boarding.slide.dart';
import 'package:covid19/screens/boarding/boarding.start.button.dart';
import 'package:covid19/screens/boarding/providers/boarding-provider.dart';
import 'package:covid19/translations/boarding-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardingScreen extends HookWidget {
  const BoardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageIndex = useProvider(boardingProvider);
    final countries = useProvider(countryProvider);
    final prefs = useProvider(preferencesProvider);
    final home = useProvider(homeCountryProvider);
    final changeTheme = AdaptiveTheme.of(context);
    final _pageController = useProvider(boardingController);

    void onPageChange(int index) => _pageIndex.changePages(index);

    void startApp({int pageIndex}) async {
      if (home.item.country == null) return _pageController.onTapIcon(4);
      await prefs.data.value.setBool(appInitKey, true);

      return Future.delayed(Duration(milliseconds: 650),
          () => Navigator.of(context).pushReplacementNamed(tabScreen));
    }

    List<Widget> _pages = [
      BoardingSlide(
        title: pageonetitle,
        subtitle: pageonesubtitle,
        flar: 'Covid19Pprotect',
        flarAnimationName: 'Animations',
      ),
      BoardingSlide(
        title: pagetwotitle,
        subtitle: pagetwosubtitle,
        flar: 'CoronaDoctor',
        flarAnimationName: 'Animations',
      ),
      BoardingSlide(
        title: pagethreetitle,
        subtitle: pagethreesubtitle,
        flar: 'AirplaneAroundTheWorld',
        flarAnimationName: 'Animations',
      ),
      BoardingSlide(
        title: pagefourtitle,
        subtitle: pagefoursubtitle,
        flar: 'StayAtHome',
        flarAnimationName: 'Animations',
      ),
      BoardingSlide(
        title: pagefivetitle,
        flarAnimationName: 'roll',
        flar: home.item.country == null ? 'WorldSpin' : null,
        subtitle: home.item.country ?? '',
        flag: home.item.country == null ? '' : home.item.countryInfo.flag,
        buttonTitle: pagefivebutton,
        buttonIcon: Icon(Ionicons.ios_pin),
        onPressed: () async {
          final search = await showSearch(
            context: context,
            delegate: KgpSearch(
              countries: countries,
              action: SearchAction.edit,
            ),
          );
          home.setCountryName(search);
        },
      ),
      BoardingSlide(
        flar: 'SuccessCheck',
        flarAnimationName: 'Untitled',
      ),
    ];

    Widget changeNavbar({int pageIndex}) {
      return home.item.country != null && pageIndex == 5
          ? ZoomIn(
              child: BoardingStartButton(
                onPressed: startApp,
              ),
            )
          : Consumer(
              builder: (context, watch, __) {
                final pageController = watch(boardingController.state);
                return BoardingBottomNav(
                  pages: _pages,
                  pageIndex: pageIndex,
                  pageController: pageController,
                  ontap: _pageController.onTapIcon,
                  themeMode: changeTheme.mode,
                );
              },
            );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        brightness:
            changeTheme.mode.isLight ? Brightness.light : Brightness.dark,
      ),
      body: Consumer(
        builder: (context, watch, __) {
          final pageController = watch(boardingController.state);
          return PageView(
            controller: pageController,
            onPageChanged: onPageChange,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: Consumer(builder: (context, watch, __) {
        final page = watch(boardingProvider.state);
        _pageController.ready(index: page, home: home);
        return changeNavbar(pageIndex: page);
      }),
    );
  }
}
