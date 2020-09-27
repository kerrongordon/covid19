import 'package:covid19/components/ads-component.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/screens/global/global-card-two.dart';
import 'package:covid19/screens/global/global-card-one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

class GlobalCardList extends StatelessWidget {
  final Global data;
  const GlobalCardList({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GlobalCardOne(data: data),
          AdsComponent(type: NativeAdmobType.full),
          GlobalCardTwo(data: data),
        ],
      ),
    );
  }
}
