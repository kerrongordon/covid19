import 'package:covid19/models/global-model.dart';
import 'package:covid19/screens/global/global-card-two.dart';
import 'package:covid19/screens/global/global-card-one.dart';
import 'package:flutter/material.dart';

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
          GlobalCardTwo(data: data),
        ],
      ),
    );
  }
}
