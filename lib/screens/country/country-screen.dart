import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/country-card-five.dart';
import 'package:covid19/screens/country/country-card-four.dart';
import 'package:covid19/screens/country/country-card-one.dart';
import 'package:covid19/screens/country/country-card-three.dart';
import 'package:covid19/screens/country/country-card-two.dart';
import 'package:covid19/screens/country/country-dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CountryScreen extends StatelessWidget {
  final Country data;
  const CountryScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: data.country,
        children: [
          Container(
            child: Column(
              children: [
                CountryCardOne(data: data),
                CountryCartTwo(data: data),
                CountryCardThree(data: data),
                CountryCardFour(data: data),
                CountryCardFive(data: data),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Ionicons.ios_add),
        onPressed: () async => await showModalBottomSheet(
          context: context,
          elevation: 30,
          backgroundColor: Colors.transparent,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20),
            child: CountryDialog(data: data),
          ),
        ),
      ),
    );
  }
}
