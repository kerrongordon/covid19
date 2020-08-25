import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/providers/travel-alert-provider.dart';
import 'package:covid19/screens/country/card-one/chart.dart';
import 'package:covid19/screens/country/card-one/title.dart';
import 'package:covid19/screens/country/card-three/item.dart';
import 'package:covid19/screens/country/card-two/card-small.dart';
import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatelessWidget {
  final Country data;
  const CountryScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: data.country,
        // background: Icon(
        //   Ionicons.ios_git_branch,
        //   size: 200,
        //   color: Theme.of(context).accentColor,
        // ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CardComponent(
              child: Container(
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
                              tag: data.country,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: CachedNetworkImage(
                                  imageUrl: data.countryInfo.flag,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
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
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
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
                    CardOneChart(
                      data: data,
                    ),
                    Container(
                      child: Row(
                        children: [
                          CardOneTitle(
                            title: 'Cases',
                            numb: data.cases,
                            color: Colors.orangeAccent,
                          ),
                          CardOneTitle(
                            title: 'Recovered',
                            numb: data.recovered,
                            color: Colors.green,
                          ),
                          CardOneTitle(
                            title: 'Deaths',
                            numb: data.deaths,
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CardComponent(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Divider(),
                    Text(
                      'Updates as of ${TimeToDate.use(data.updated)}',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 25),
                    Container(
                      child: Row(
                        children: [
                          CardThreeItem(
                            data: data.todayCases,
                            title: 'Confirmed',
                            color: Colors.orangeAccent,
                          ),
                          CardThreeItem(
                            data: data.todayDeaths,
                            title: 'Deaths',
                            color: Colors.redAccent,
                          ),
                          CardThreeItem(
                            data: data.todayRecovered,
                            title: 'Recovered',
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CardTwoSmall(
                  title: 'Active',
                  number: data.active,
                ),
                SizedBox(width: 20),
                CardTwoSmall(
                  title: 'Critical',
                  number: data.critical,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CardTwoSmall(
                  title: 'Test Done',
                  number: data.tests,
                ),
                SizedBox(width: 20),
                CardTwoSmall(
                  title: 'Population',
                  number: data.population,
                ),
              ],
            ),
          ),
          Consumer<TravelAlertProvider>(
            builder: (context, value, child) {
              return FutureBuilder(
                future: value.getTravelAlert(),
                builder: (context, AsyncSnapshot<List<TravelAlert>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Container();
                      break;
                    case ConnectionState.waiting:
                      return KgpLoader();
                      break;
                    case ConnectionState.active:
                      return KgpLoader();
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Center(
                            child: Text('Oh no something went wrong 😥️'));
                      } else if (!snapshot.hasData) {
                        return Center(
                            child: Text('There seem to be a problem 😤️'));
                      } else {
                        final datal = snapshot.data
                            .where((item) =>
                                item.countryCode == data.countryInfo.iso2)
                            .toList();

                        return ListView.builder(
                          itemCount: datal.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var split =
                                datal[index].alertMessage.split('\n').map((i) {
                              if (i == "") {
                                return SizedBox(height: 10);
                              } else {
                                return Text(
                                  i,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                );
                              }
                            }).toList();
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                child: CardComponent(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            'Travel Alert',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                        Text(
                                          'Updates as of ${datal[index].publishedDate}',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(height: 25),
                                        Container(
                                          child: Column(
                                            children: split,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      break;
                    default:
                      return Container();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
