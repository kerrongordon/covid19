import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/screens/boarding/boarding.indicator.dart';
import 'package:covid19/translations/boarding-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BoardingBottomNav extends StatelessWidget {
  const BoardingBottomNav({
    @required List<Widget> pages,
    @required ValueNotifier<int> pageIndex,
    @required PageController pageController,
    AdaptiveThemeMode themeMode,
    this.ontap,
  })  : _pages = pages,
        _pageIndex = pageIndex,
        _pageController = pageController,
        _themeMode = themeMode;

  final List<Widget> _pages;
  final ValueNotifier<int> _pageIndex;
  final PageController _pageController;
  final void Function(int) ontap;
  final AdaptiveThemeMode _themeMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _pageIndex.value == _pages.length - 2 ||
                  _pageIndex.value == _pages.length - 1
              ? Container(
                  width: 89,
                  height: 40,
                )
              : FlatButton(
                  onPressed: () => ontap(_pages.length - 2),
                  child: Text(
                    skipbutton,
                    style: TextStyle(
                      color:
                          _themeMode.isLight ? Colors.black54 : Colors.white54,
                    ),
                  ),
                ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < _pages.length - 1; i++)
                  _pageIndex.value == i
                      ? BoardingIndicator(
                          toggle: true,
                          onTap: () => ontap(i),
                        )
                      : BoardingIndicator(
                          onTap: () => ontap(i),
                        )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: IconButton(
              icon: Icon(
                Ionicons.ios_arrow_round_forward,
                size: 30,
                color: _themeMode.isLight ? Colors.black54 : Colors.white54,
              ),
              onPressed: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
