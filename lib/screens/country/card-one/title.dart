import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';

class CardOneTitle extends StatelessWidget {
  final String title;
  final int numb;
  final Color color;
  const CardOneTitle({
    Key key,
    this.title,
    this.numb,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              CommaUtil.use(numb),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
