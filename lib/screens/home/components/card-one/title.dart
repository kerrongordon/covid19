import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';

class CardOneTitle extends StatelessWidget {
  final String title;
  final Color color;
  final int number;
  const CardOneTitle({
    Key key,
    this.title,
    this.color,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: color,
          ),
        ),
        SizedBox(height: 5),
        Text(CommaUtil.use(number)),
        SizedBox(height: 20),
      ],
    );
  }
}
