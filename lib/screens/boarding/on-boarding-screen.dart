import 'package:covid19/components/kgp-flag.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/boarding/countries-list.dart';
import 'package:covid19/tabview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends HookWidget {
  OnBoardingPage({Key key}) : super(key: key);
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd({
    BuildContext context,
    ValueNotifier<String> countryName,
    AsyncValue<SharedPreferences> prefs,
  }) async {
    if (countryName.value == null || countryName.value == '') {
      return introKey.currentState.animateScroll(4);
    }
    await prefs.data.value.setBool('seen', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => TabView()),
    );
  }

  Widget _buildLottie(String assetName) {
    return Align(
      child: Lottie.asset('assets/$assetName.json',
          repeat: true, animate: true, height: 250.0),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildFlag(ValueNotifier<List<Country>> countryImage) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: KgpFlag(
          tag: 'home',
          imageUrl: countryImage.value[0].countryInfo.flag,
          imageHeight: 150.0,
          imageWidth: 150.0,
        ),
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefs = useProvider(preferencesProvider);
    final countries = useProvider(countryProvider);
    final countryName = useState('');
    final ValueNotifier<List<Country>> countryImage = useState([]);

    const bodyStyle = TextStyle(fontSize: 19.0);
    final textcolor = Theme.of(context).textTheme.bodyText1.color;
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Theme.of(context).backgroundColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Covid 19 Tracker",
          body:
              "Get the Facts About Coronavirus Daily cases update around the world",
          image: _buildLottie('28663-coronavirus-covid-19'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Take steps to care for yourself and help protect others in your home and community.",
          image: _buildLottie('29877-washing-hands'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Travel Advisories",
          body:
              "Official travel advisories issued by governments across the globe.",
          image: _buildLottie('airplane'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Stay At Home",
          body:
              "If you have symptoms of COVID-19 however mild, self-isolate for at least 10 days from when your symptoms started.",
          image: _buildLottie('18168-stay-safe-stay-home'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Select Your Country",
          // image: _buildLottie('3169-world'),
          image: countryImage.value.isEmpty
              ? _buildLottie('3169-world')
              : _buildFlag(countryImage),
          bodyWidget: Text(
            countryName.value ?? '',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          footer: RaisedButton.icon(
            elevation: 5,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5,
              bottom: 5,
            ),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            icon: Icon(Ionicons.ios_pin),
            label: const Text('View More'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: CountryList(
                  data: countries.data.value,
                  perf: prefs.data.value,
                ),
              );
              String name = prefs.data.value.getString('myhomecountry');
              countryName.value = name;
              countryImage.value = countries.data.value
                  .where((element) => name == element.country)
                  .toList();
            },
          ),

          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Let's Go !",
          body: "",
          image: _buildLottie('22932-lets-tick'),
        ),
      ],
      onDone: () => _onIntroEnd(
        context: context,
        countryName: countryName,
        prefs: prefs,
      ),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text(
        'Skip',
        style: TextStyle(color: textcolor),
      ),
      next: Icon(
        Icons.arrow_forward,
        color: textcolor,
      ),
      done: Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textcolor,
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
