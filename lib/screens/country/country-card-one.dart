import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-pie-chart.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';

class CountryCardOne extends StatelessWidget {
  final Country data;
  const CountryCardOne({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Covid-19',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Last Updated on ${TimeToDate.use(data.updated)}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: data.countryInfo.iso2,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: data.countryInfo.flag,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          KgpPieChart(
            aspectRatio: 1.3,
            cases: data.cases,
            recovered: data.recovered,
            deaths: data.deaths,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Cases',
                    amount: data.cases,
                    amountFontSize: 18,
                    titleFontSize: 18,
                    titlecolor: ColorTheme.cases,
                  ),
                ),
                Expanded(
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Recovered',
                    amount: data.recovered,
                    amountFontSize: 18,
                    titleFontSize: 18,
                    titlecolor: ColorTheme.recovered,
                  ),
                ),
                Expanded(
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Deaths',
                    amount: data.deaths,
                    amountFontSize: 18,
                    titleFontSize: 18,
                    titlecolor: ColorTheme.deaths,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
