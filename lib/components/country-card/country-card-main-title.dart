import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class CountryCardMailTitle extends StatelessWidget {
  final int date;
  const CountryCardMailTitle({
    Key key,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _date = TimeToDate.use(date);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            child: Text(
              'Covid-19',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10),
          FadeInUp(
            child: Text(
              'Last Updated on $_date',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
