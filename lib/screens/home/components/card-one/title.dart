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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          CommaUtil.use(number),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.end,
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: color,
          ),
          textAlign: TextAlign.end,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
