import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/covid-Infor.model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
// import 'package:lottie/lottie.dart';

class InforPage extends StatelessWidget {
  final Infor data;
  final int index;

  const InforPage({Key key, this.data, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: data.title,
        expandedHeight: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: FlareActor(
                "assets/flar/${data.lottie}.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: 'Animations',
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CardComponent(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        data.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const AdsComponent(type: NativeAdmobType.full),
            ),
          ],
        ),
      ),
    );
  }
}
