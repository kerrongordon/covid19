import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/box-card.dart';
import 'package:covid19/components/home-card-item.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/summary-model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryPage extends StatelessWidget {
  final Countries data;

  const CountryPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.parse(data.date);
    DateFormat formatter = new DateFormat('EEEE MMMM d y');
    String formatted = formatter.format(_date);

    return Scaffold(
      body: KgpBasePage(
        expandedHeight: 300,
        title: data.country,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BoxCard(
                  title: 'Death',
                  color: Colors.red,
                  value: data.totalDeaths.toString(),
                ),
                BoxCard(
                  title: 'Recovered',
                  color: Colors.green,
                  value: data.totalRecovered.toString(),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              color: Colors.brown,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 20),
                              child: Text(
                                'Confirmed',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 20),
                              child: Text(
                                data.totalConfirmed.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent,
                                  fontSize: 50,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 100),
                          child: CachedNetworkImage(
                            height: 64,
                            imageUrl:
                                'https://www.countryflags.io/${data.countryCode}/flat/64.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text('As of $formatted'),
                SizedBox(height: 20),
                HomeCardItem(
                  title: 'New Confirmed Cases',
                  fontSizetitle: 15,
                  fontSizetrailing: 20,
                  verticalPad: 3,
                  space: 5,
                  position: 4,
                  value: data.newConfirmed.toString(),
                  color: Colors.blue[800],
                ),
                HomeCardItem(
                  title: 'New Recovered Cases',
                  fontSizetitle: 15,
                  fontSizetrailing: 20,
                  verticalPad: 3,
                  space: 5,
                  position: 4,
                  value: data.newRecovered.toString(),
                  color: Colors.blue[800],
                ),
                HomeCardItem(
                  title: 'New Death Cases',
                  fontSizetitle: 15,
                  fontSizetrailing: 20,
                  verticalPad: 3,
                  space: 5,
                  position: 4,
                  value: data.newDeaths.toString(),
                  color: Colors.blue[800],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
