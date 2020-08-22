import 'package:flutter/material.dart';
import 'package:covid19/utils/comma.util.dart';

class CardTwoItem extends StatelessWidget {
  final String title;
  final int data;
  final Color color;
  const CardTwoItem({
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
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
