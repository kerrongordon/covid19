import 'package:covid19/components/ads-component.dart';
import 'package:covid19/providers/covid-infor-provider.dart';
import 'package:covid19/screens/information/Infor-Item.dart';
import 'package:covid19/translations/infor-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InforList extends HookWidget {
  const InforList();

  @override
  Widget build(BuildContext context) {
    final infor = useProvider(covidInforProvider);
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.7,
          child: Image.asset('assets/splash1.png'),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            pagesubtitle,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: AdsComponent(type: NativeAdmobType.banner),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: infor.length,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 50,
          ),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InforItem(data: infor[index]);
          },
        ),
      ],
    );
  }
}
