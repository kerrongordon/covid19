import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/screens/boarding/countries-list.dart';
import 'package:covid19/tabview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart' as oldProvider;
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    if (countryName == null || countryName == '') {
      return introKey.currentState.animateScroll(4);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => TabView()),
    );
  }

  Widget _buildLottie(String assetName) {
    return Align(
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Lottie.asset('assets/$assetName.json',
            repeat: true, animate: true, height: 250.0),
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  String countryName = '';

  @override
  Widget build(BuildContext context) {
    final _countries = useProvider(countryProvider);
    Future<SharedPreferences> _perf =
        oldProvider.Provider.of<Future<SharedPreferences>>(context);

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
          image: _buildLottie('17949-corona-doctor'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Travel Advisories",
          body:
              "official travel advisories issued by governments across the globe.",
          image: _buildLottie('airplane'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Stay At Home",
          body:
              "If you have symptoms of COVID-19 however mild, self-isolate for at least 10 days from when your symptoms started.",
          image: _buildLottie('20546-i-stay-at-home'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Select Your Country",
          image: _buildLottie('3169-world'),
          bodyWidget: Text(
            countryName ?? '',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          footer: RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: CountryList(
                  data: _countries.data.value,
                  perf: _perf,
                ),
              );
              final userCountry = await _perf;
              String count = userCountry.getString('myhomecountry');
              setState(() {
                countryName = count;
              });
            },
            child: const Text("Select"),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Let's Go !",
          body: "",
          image: _buildLottie('22932-lets-tick'),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
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
