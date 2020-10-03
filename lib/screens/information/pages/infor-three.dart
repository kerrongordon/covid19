import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:lottie/lottie.dart';

class InforThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Avoid close contact',
        expandedHeight: 55,
        child: Column(
          children: [
            Lottie.asset(
              'assets/social-distancing-imperial.json',
              repeat: true,
              animate: true,
              height: 300,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CardComponent(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Avoid close contact with people who are sick',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Stay home as much as possible',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.3,
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                      trailing: Hero(
                        tag: 3,
                        child: Image.asset('assets/three.png'),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Put distance between yourself and other people.',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Remember that some people without symptoms may be able to spread virus.',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.3,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Keeping distance from others is especially important for people who are at higher risk of getting very sick.',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AdsComponent(type: NativeAdmobType.banner),
            ),
          ],
        ),
      ),
    );
  }
}
