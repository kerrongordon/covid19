import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/covid-Infor.model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

class InforPage extends StatelessWidget {
  final CovidInfor data;

  const InforPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final changeTheme = AdaptiveTheme.of(context);
    final colorText = changeTheme.theme.textTheme.bodyText1.color;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AdsComponent(
                type: NativeAdmobType.banner,
                color: changeTheme.mode.isLight ? Colors.brown : null,
                textColor: changeTheme.mode.isLight ? Colors.white : null,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CardComponent(
                color: changeTheme.mode.isLight ? Colors.blue : null,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        data.description ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          color: changeTheme.mode.isLight
                              ? Colors.white
                              : colorText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
