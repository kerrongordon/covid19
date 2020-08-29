import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/providers/travel-alert-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CountryCardFour extends StatelessWidget {
  final Country data;
  const CountryCardFour({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TravelAlertProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.getTravelAlert(countrycode: data.countryInfo.iso2),
          builder: (context, AsyncSnapshot<TravelAlert> snapshot) {
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
                  return Center(child: Text('Oh no something went wrong 😥️'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('There seem to be a problem 😤️'));
                } else {
                  final datal = snapshot.data.data;

                  for (var val in datal.values) {
                    final String _date =
                        DateFormat.yMMMMEEEEd().format(val.advisory.updated);
                    return Container(
                      child: FadeInUp(
                        child: CardComponent(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              KgpCardTitle(
                                title: 'Travel Alert',
                                subtitle: 'Updates as of $_date',
                                icon: Icon(Ionicons.ios_airplane),
                              ),
                              Container(
                                child: Text(
                                  val.advisory.message,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                }
                break;
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}
