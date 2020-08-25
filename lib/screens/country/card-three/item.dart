import 'package:flutter/material.dart';
import 'package:covid19/utils/comma.util.dart';

class CardThreeItem extends StatelessWidget {
  final String title;
  final int data;
  final Color color;
  const CardThreeItem({
    Key key,
    this.color,
    @required this.data,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              CommaUtil.use(data),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                // color: color,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
