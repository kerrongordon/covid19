import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/covid-Infor.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

class InforPage extends StatelessWidget {
  final CovidInfor data;

  const InforPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: data.title,
        expandedHeight: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.7,
              child: Hero(
                tag: data.image,
                child: Image.asset(
                  'assets/infor/${data.image}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AdsComponent(type: NativeAdmobType.banner),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CardComponent(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        data.description ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
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
