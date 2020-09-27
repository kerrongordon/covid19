import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/screens/information/pages/infor-five.dart';
import 'package:covid19/screens/information/pages/infor-four.dart';
import 'package:covid19/screens/information/pages/infor-one.dart';
import 'package:covid19/screens/information/pages/infor-six.dart';
import 'package:covid19/screens/information/pages/infor-three.dart';
import 'package:covid19/screens/information/pages/infor-two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:lottie/lottie.dart';

class InforScreen extends HookWidget {
  const InforScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAliveClient();
    return Scaffold(
      body: KgpBasePage(
        title: 'Protect Yourself & Others',
        expandedHeight: 55,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Lottie.asset(
                  'assets/medical-frontliners.json',
                  repeat: true,
                  animate: true,
                  height: 300,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Text(
                    'COVID-19 is thought to spread mainly through close contact from person-to-person. Some people without symptoms may be able to spread the virus. We are still learning about how the virus spreads and the severity of illness it causes.',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: CardInforOne(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 20),
                        child: CardInforTwo(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: CardInforThree(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 20),
                        child: CardInforFour(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: CardInforFive(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 20),
                        child: CardInforSix(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AdsComponent(type: NativeAdmobType.banner),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CardInforSix extends StatelessWidget {
  const CardInforSix({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InforSix(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ZoomIn(
              child: Hero(
                tag: 6,
                child: Image.asset(
                  'assets/six.png',
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            FadeInDown(
              child: Text(
                'Clean and disinfect',
                style: TextStyle(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInforFive extends StatelessWidget {
  const CardInforFive({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InforFive(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ZoomIn(
              child: Hero(
                tag: 5,
                child: Image.asset(
                  'assets/five.png',
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            FadeInDown(
              child: Text(
                'Cover coughs and sneezes',
                style: TextStyle(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInforFour extends StatelessWidget {
  const CardInforFour({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InforFour(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ZoomIn(
              child: Hero(
                tag: 4,
                child: Image.asset(
                  'assets/four.png',
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            FadeInDown(
              child: Text(
                'Cover your mouth and nose',
                style: TextStyle(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInforThree extends StatelessWidget {
  const CardInforThree({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InforThree(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ZoomIn(
              child: Hero(
                tag: 3,
                child: Image.asset(
                  'assets/three.png',
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            FadeInDown(
              child: Text(
                'Avoid close contact',
                style: TextStyle(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInforTwo extends StatelessWidget {
  const CardInforTwo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InforTwo(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ZoomIn(
              child: Hero(
                tag: 2,
                child: Image.asset(
                  'assets/two.png',
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            FadeInDown(
              child: Text(
                'Clean your hands often',
                style: TextStyle(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInforOne extends StatelessWidget {
  const CardInforOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InforOne(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ZoomIn(
              child: Hero(
                tag: 1,
                child: Image.asset(
                  'assets/one.png',
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            FadeInDown(
              child: Text(
                'Know How it Spreads',
                style: TextStyle(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
