import 'package:covid19/components/ads-component.dart';
import 'package:covid19/models/covid-Infor.model.dart';
import 'package:covid19/screens/information/Infor-Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

class InforList extends StatelessWidget {
  final CovidInfor data;
  const InforList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data.pageTitle);
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.7,
          child: Image.asset('assets/splash1.png'),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            data.pageTitle ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: data.infor.length,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InforItem(
                data: data,
                index: index,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const AdsComponent(type: NativeAdmobType.banner),
        )
      ],
    );
  }
}
