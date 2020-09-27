import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TabBottomBar extends StatelessWidget {
  const TabBottomBar({
    Key key,
    @required ValueNotifier<int> pageIndex,
    @required this.onItemSelected,
  })  : _pageIndex = pageIndex,
        super(key: key);

  final ValueNotifier<int> _pageIndex;
  final void Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _changeTheme = AdaptiveTheme.of(context);
    return BottomNavyBar(
      backgroundColor: _theme.cardTheme.color,
      selectedIndex: _pageIndex.value,
      showElevation: true,
      onItemSelected: onItemSelected,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          title: const Text('Global'),
          textAlign: TextAlign.center,
          icon: const Icon(Ionicons.ios_analytics),
          activeColor:
              _changeTheme.mode.isDark ? Colors.white : _theme.accentColor,
          inactiveColor: _theme.textTheme.bodyText1.color,
        ),
        BottomNavyBarItem(
          title: const Text('Countries'),
          textAlign: TextAlign.center,
          icon: const Icon(Ionicons.ios_trending_up),
          activeColor:
              _changeTheme.mode.isDark ? Colors.white : _theme.accentColor,
          inactiveColor: _theme.textTheme.bodyText1.color,
        ),
        BottomNavyBarItem(
          title: const Text('Home'),
          textAlign: TextAlign.center,
          icon: const Icon(Ionicons.ios_pin),
          activeColor:
              _changeTheme.mode.isDark ? Colors.white : _theme.accentColor,
          inactiveColor: _theme.textTheme.bodyText1.color,
        ),
        BottomNavyBarItem(
          title: const Text('Info'),
          textAlign: TextAlign.center,
          icon: const Icon(Ionicons.ios_apps),
          activeColor:
              _changeTheme.mode.isDark ? Colors.white : _theme.accentColor,
          inactiveColor: _theme.textTheme.bodyText1.color,
        ),
        BottomNavyBarItem(
          title: const Text('Settings'),
          textAlign: TextAlign.center,
          icon: const Icon(Ionicons.ios_cog),
          activeColor:
              _changeTheme.mode.isDark ? Colors.white : _theme.accentColor,
          inactiveColor: _theme.textTheme.bodyText1.color,
        ),
      ],
    );
  }
}
