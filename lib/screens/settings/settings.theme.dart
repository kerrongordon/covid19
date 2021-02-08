import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/themes/dark-theme.dart';
import 'package:covid19/themes/light-theme.dart';
import 'package:covid19/translations/setting-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class SettingsTheme extends HookWidget {
  const SettingsTheme({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeTheme = AdaptiveTheme.of(context);

    final themeState = useState(changeTheme.mode.isDark);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FadeInUp(
        child: CardComponent(
          padding: const EdgeInsets.all(20),
          child: ListTileSwitch(
            value: themeState.value,
            switchActiveColor: changeTheme.theme.accentColor,
            focusColor: changeTheme.theme.accentColor,
            leading: Icon(
              Ionicons.ios_contrast,
              color: changeTheme.theme.accentColor,
            ),
            onChanged: (value) {
              themeState.value = value;
              changeTheme.toggleThemeMode();
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                systemNavigationBarColor: !value
                    ? LightTheme.lightBackground
                    : DarkTheme.darkBackground ?? LightTheme.lightBackground,
                systemNavigationBarIconBrightness: !value
                    ? Brightness.dark
                    : Brightness.light ?? Brightness.dark,
              ));
            },
            visualDensity: VisualDensity.compact,
            switchType: SwitchType.material,
            title: Text(lightdark),
          ),
        ),
      ),
    );
  }
}
