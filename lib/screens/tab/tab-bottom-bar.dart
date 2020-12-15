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
    return BottomNavyBar(
      backgroundColor: Colors.transparent,
      selectedIndex: _pageIndex.value,
      showElevation: false,
      onItemSelected: onItemSelected,
      items: <BottomNavyBarItem>[
        buildBottomNavyBarItem(
          title: 'Global',
          theme: _theme,
          icon: Icon(Ionicons.ios_analytics),
        ),
        buildBottomNavyBarItem(
          title: 'Countries',
          theme: _theme,
          icon: Icon(Ionicons.ios_trending_up),
        ),
        buildBottomNavyBarItem(
          title: 'Home',
          theme: _theme,
          icon: Icon(Ionicons.ios_pin),
        ),
        buildBottomNavyBarItem(
          title: 'Info',
          theme: _theme,
          icon: Icon(Ionicons.ios_apps),
        ),
        buildBottomNavyBarItem(
          title: 'Settings',
          theme: _theme,
          icon: Icon(Ionicons.ios_cog),
        ),
      ],
    );
  }

  BottomNavyBarItem buildBottomNavyBarItem({
    ThemeData theme,
    String title,
    Widget icon,
  }) {
    return BottomNavyBarItem(
      title: Text(title),
      textAlign: TextAlign.center,
      icon: icon,
      activeColor: theme.accentColor,
      inactiveColor: theme.textTheme.bodyText1.color,
    );
  }
}
