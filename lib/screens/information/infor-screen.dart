import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-bottom-dialog.dart';
import 'package:covid19/screens/information/pages/infor-five.dart';
import 'package:covid19/screens/information/pages/infor-four.dart';
import 'package:covid19/screens/information/pages/infor-one.dart';
import 'package:covid19/screens/information/pages/infor-six.dart';
import 'package:covid19/screens/information/pages/infor-three.dart';
import 'package:covid19/screens/information/pages/infor-two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lottie/lottie.dart';

class InforScreen extends StatelessWidget {
  const InforScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Protect Yourself & Others',
        expandedHeight: 55,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Lottie.asset(
                    'assets/medical-frontliners.json',
                    repeat: true,
                    animate: true,
                  ),
                ),
                CardInforOne(),
                CardInforTwo(),
                CardInforThree(),
                CardInforFour(),
                CardInforFive(),
                CardInforSix(),
              ],
            ),
          ),
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
      onTap: () async => await showModalBottomSheet(
        context: context,
        elevation: 30,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: KgpBottomDialog(
            title: 'Clean and disinfect',
            child: InforSix(),
          ),
        ),
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 12),
        child: ListTile(
          leading: ZoomIn(
            child: Image.asset('assets/six.png'),
          ),
          title: FadeInDown(
            child: Text(
              'Clean and disinfect',
              style:
                  TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            ),
          ),
          trailing: FadeInLeft(
            child: Icon(
              Ionicons.ios_arrow_forward,
              color: Theme.of(context).primaryColor,
            ),
          ),
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
      onTap: () async => await showModalBottomSheet(
        context: context,
        elevation: 30,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: KgpBottomDialog(
            title: 'Cover coughs and sneezes',
            child: InforFive(),
          ),
        ),
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 12),
        child: ListTile(
          leading: ZoomIn(
            child: Image.asset('assets/five.png'),
          ),
          title: FadeInDown(
            child: Text(
              'Cover coughs and sneezes',
              style:
                  TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            ),
          ),
          trailing: FadeInLeft(
            child: Icon(
              Ionicons.ios_arrow_forward,
              color: Theme.of(context).primaryColor,
            ),
          ),
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
      onTap: () async => await showModalBottomSheet(
        context: context,
        elevation: 30,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: KgpBottomDialog(
            title: 'Cover your mouth and nose',
            child: InforFour(),
          ),
        ),
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 12),
        child: ListTile(
          leading: ZoomIn(
            child: Image.asset('assets/four.png'),
          ),
          title: FadeInDown(
            child: Text(
              'Cover your mouth and nose',
              style:
                  TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            ),
          ),
          trailing: FadeInLeft(
            child: Icon(
              Ionicons.ios_arrow_forward,
              color: Theme.of(context).primaryColor,
            ),
          ),
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
      onTap: () async => await showModalBottomSheet(
        context: context,
        elevation: 30,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: KgpBottomDialog(
            title: 'Avoid close contact',
            child: InforThree(),
          ),
        ),
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 12),
        child: ListTile(
          leading: ZoomIn(
            child: Image.asset('assets/three.png'),
          ),
          title: FadeInDown(
            child: Text(
              'Avoid close contact',
              style:
                  TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            ),
          ),
          trailing: FadeInLeft(
            child: Icon(
              Ionicons.ios_arrow_forward,
              color: Theme.of(context).primaryColor,
            ),
          ),
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
      onTap: () async => await showModalBottomSheet(
        context: context,
        elevation: 30,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: KgpBottomDialog(
            title: 'Clean your hands often',
            child: InforTwo(),
          ),
        ),
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 12),
        child: ListTile(
          leading: ZoomIn(
            child: Image.asset('assets/two.png'),
          ),
          title: FadeInDown(
            child: Text(
              'Clean your hands often',
              style:
                  TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            ),
          ),
          trailing: FadeInLeft(
            child: Icon(
              Ionicons.ios_arrow_forward,
              color: Theme.of(context).primaryColor,
            ),
          ),
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
      onTap: () async => await showModalBottomSheet(
        context: context,
        elevation: 30,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: KgpBottomDialog(
            title: 'Know How it Spreads',
            child: InforOne(),
          ),
        ),
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 12),
        child: ListTile(
          leading: ZoomIn(
            child: Image.asset('assets/one.png'),
          ),
          title: FadeInDown(
            child: Text(
              'Know How it Spreads',
              style:
                  TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            ),
          ),
          trailing: FadeInLeft(
            child: Icon(
              Ionicons.ios_arrow_forward,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
