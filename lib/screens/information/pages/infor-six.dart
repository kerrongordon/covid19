import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:lottie/lottie.dart';

class InforSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Clean and disinfect',
        expandedHeight: 55,
        children: <Widget>[
          Lottie.asset(
            'assets/21426-cleaning.json',
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
                      'Clean AND disinfect frequently touched surfaces daily. This includes tables, doorknobs, light switches, countertops, handles, desks, phones, keyboards, toilets, faucets, and sinks.',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                    trailing: Hero(
                      tag: 6,
                      child: Image.asset('assets/six.png'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'If surfaces are dirty, clean them: Use detergent or soap and water prior to disinfection.',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
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
    );
  }
}
