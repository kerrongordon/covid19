import 'package:covid19/components/card-component.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';

class CardTwoSmall extends StatelessWidget {
  final int number;
  final String title;
  const CardTwoSmall({
    Key key,
    this.number,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardComponent(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                CommaUtil.use(number),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
