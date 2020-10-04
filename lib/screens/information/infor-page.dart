import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/covid-Infor.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:lottie/lottie.dart';

class InforPage extends StatelessWidget {
  final Infor data;

  const InforPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: data.title,
        expandedHeight: 55,
        child: Column(
          children: [
            Lottie.asset(
              'assets/${data.lottie}',
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
                      trailing: Hero(
                        tag: 1,
                        child: Image.asset('assets/${data.image}'),
                      ),
                      title: Text(
                        data.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.3,
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const AdsComponent(type: NativeAdmobType.full),
            ),
          ],
        ),
      ),
    );
  }
}
