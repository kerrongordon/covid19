import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/search/kgp-search.dart';
import 'package:covid19/configs/data.config.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/home-provider.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/providers/theme-mode-provider.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:covid19/screens/boarding/boarding.bottom.nav.dart';
import 'package:covid19/screens/boarding/boarding.slide.dart';
import 'package:covid19/screens/boarding/boarding.start.button.dart';
import 'package:covid19/translations/boarding-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardingScreen extends HookWidget {
  const BoardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageIndex = useState(0);
    final countries = useProvider(countryProvider);
    final prefs = useProvider(preferencesProvider);
    final home = useProvider(homeCountryProvider);
    final changeTheme = AdaptiveTheme.of(context);
    final _pageController = usePageController(initialPage: _pageIndex.value);

    void onPageChange(int index) => _pageIndex.value = index;
    void onTapIcon(int index) => _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linear,
        );

    void startApp() async {
      if (home.item.country == null) return onTapIcon(4);
      await prefs.data.value.setBool(appInitKey, true);

      return Future.delayed(Duration(milliseconds: 650),
          () => Navigator.of(context).pushReplacementNamed(tabScreen));
    }

    _pageController.addListener(() {
      if (_pageIndex.value == 5) {
        if (home.item.country == null) return onTapIcon(4);
      }
    });

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

    Widget changeNavbar() {
      return home.item.country != null && _pageIndex.value == 5
          ? BoardingStartButton(
              onPressed: startApp,
            )
          : BoardingBottomNav(
              pages: _pages,
              pageIndex: _pageIndex,
              pageController: _pageController,
              ontap: onTapIcon,
              themeMode: changeTheme.mode,
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
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChange,
        children: _pages,
      ),
      bottomNavigationBar: changeNavbar(),
    );
  }
}
