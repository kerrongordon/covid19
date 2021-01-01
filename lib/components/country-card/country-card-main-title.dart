import 'package:covid19/translations/app-translate.dart';
import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';

class CountryCardMailTitle extends StatelessWidget {
  final int date;
  const CountryCardMailTitle({
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final String _date = TimeToDate.use(date);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Covid-19',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$updatedasof $_date',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
