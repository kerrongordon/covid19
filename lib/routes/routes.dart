import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/covid-Infor.model.dart';
import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:covid19/screens/country/country-screen.dart';
import 'package:covid19/screens/country/us-states/us-state.dart';
import 'package:covid19/screens/country/us-states/usstate-screen.dart';
import 'package:covid19/screens/information/infor-page.dart';
import 'package:covid19/screens/map/map-screen.dart';
import 'package:covid19/screens/splash/splash.screen.dart';
import 'package:covid19/screens/tab/tab-screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case startScreen:
        return MaterialPageRoute(builder: (_) => Splash());
      case tabScreen:
        return MaterialPageRoute(builder: (_) => TabScreen());
      case mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());
      case inforPageScreen:
        return args is CovidInfor
            ? MaterialPageRoute(builder: (_) => InforPage(data: args))
            : MaterialPageRoute(builder: (_) => KgpCenter());
      case countryScreen:
        return args is Country
            ? MaterialPageRoute(builder: (_) => CountryScreen(data: args))
            : MaterialPageRoute(builder: (_) => KgpCenter());
      case usStatePageScreen:
        return MaterialPageRoute(builder: (_) => UsStateScreen());
      case usState:
        return args is UsStates
            ? MaterialPageRoute(builder: (_) => UsState(data: args))
            : MaterialPageRoute(builder: (_) => KgpCenter());
      default:
        return MaterialPageRoute(builder: (_) => KgpCenter());
    }
  }
}
