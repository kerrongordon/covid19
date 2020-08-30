import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/screens/information/pages/infor-five.dart';
import 'package:covid19/screens/information/pages/infor-four.dart';
import 'package:covid19/screens/information/pages/infor-one.dart';
import 'package:covid19/screens/information/pages/infor-six.dart';
import 'package:covid19/screens/information/pages/infor-three.dart';
import 'package:covid19/screens/information/pages/infor-two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_icons/flutter_icons.dart';

class InforScreen extends StatelessWidget {
  const InforScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        // background: Icon(
        //   Ionicons.ios_apps,
        //   size: 250,
        //   color: Theme.of(context).accentColor,
        // ),
        title: 'Protect Yourself & Others',
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                CardComponent(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InforOne())),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.only(top: 12),
                    child: ListTile(
                      leading: ZoomIn(
                        child: Hero(
                          tag: 1,
                          child: Image.asset('assets/one.png'),
                        ),
                      ),
                      title: FadeInDown(
                        child: Text(
                          'Know How it Spreads',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
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
                ),
                CardComponent(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InforTwo())),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.only(top: 12),
                    child: ListTile(
                      leading: ZoomIn(
                        child: Hero(
                          tag: 2,
                          child: Image.asset('assets/two.png'),
                        ),
                      ),
                      title: FadeInDown(
                        child: Text(
                          'Clean your hands often',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
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
                ),
                CardComponent(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InforThree())),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.only(top: 12),
                    child: ListTile(
                      leading: ZoomIn(
                        child: Hero(
                          tag: 3,
                          child: Image.asset('assets/three.png'),
                        ),
                      ),
                      title: FadeInDown(
                        child: Text(
                          'Avoid close contact',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
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
                ),
                CardComponent(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InforFour())),
                  child: Container(
                    height: 90,
                    padding: const EdgeInsets.only(top: 12),
                    child: ListTile(
                      leading: ZoomIn(
                        child: Hero(
                          tag: 4,
                          child: Image.asset('assets/four.png'),
                        ),
                      ),
                      title: FadeInDown(
                        child: Text(
                          'Cover your mouth and nose with a cloth face cover when around others',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
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
                ),
                CardComponent(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InforFive())),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.only(top: 12),
                    child: ListTile(
                      leading: ZoomIn(
                        child: Hero(
                          tag: 5,
                          child: Image.asset('assets/five.png'),
                        ),
                      ),
                      title: FadeInDown(
                        child: Text(
                          'Cover coughs and sneezes',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
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
                ),
                CardComponent(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InforSix())),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.only(top: 12),
                    child: ListTile(
                      leading: ZoomIn(
                        child: Hero(
                          tag: 6,
                          child: Image.asset('assets/six.png'),
                        ),
                      ),
                      title: FadeInDown(
                        child: Text(
                          'Clean and disinfect',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
