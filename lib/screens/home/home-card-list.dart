import 'package:covid19/models/global-model.dart';
import 'package:covid19/screens/home/home-card-country.dart';
import 'package:covid19/screens/home/home-card-one.dart';
import 'package:covid19/screens/home/home-card-two.dart';
import 'package:flutter/material.dart';

class HomeCardList extends StatelessWidget {
  final Global data;
  const HomeCardList({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          HomeCardOne(data: data),
          HomeCardTwo(data: data),
          HomeCardCountry(),
        ],
      ),
    );
  }
}
