import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-big-card.dart';
import 'package:covid19/models/country-statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CountryPage extends StatelessWidget {
  final CountryStatistics data;

  const CountryPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        expandedHeight: 50,
        title: data.country,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Hero(
            tag: data.countryInfo.id != null ? data.countryInfo.id : 2000,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: data.countryInfo.flag,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: KgpBigCard(
              title: 'Cases',
              total: data.cases,
              today: data.todayCases,
              color: Colors.orangeAccent,
              icon: Icon(
                Ionicons.ios_analytics,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: KgpBigCard(
              title: 'Recovered',
              total: data.recovered,
              color: Colors.green,
              icon: Icon(
                Ionicons.ios_walk,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: KgpBigCard(
              title: 'Death',
              total: data.deaths,
              today: data.todayDeaths,
              color: Colors.redAccent,
              icon: Icon(
                Ionicons.ios_person_add,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: KgpBigCard(
              title: 'Critical',
              total: data.critical,
              color: Colors.blue[700],
              icon: Icon(
                Ionicons.ios_bed,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
