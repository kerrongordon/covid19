import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/models/travel-alert-model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class CountryCardTravelAlert extends StatelessWidget {
  final Datum data;
  const CountryCardTravelAlert({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat.yMMMMEEEEd().format(data.advisory.updated);
    return CardComponent(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          KgpCardTitle(
            title: 'Travel Alert',
            subtitle: 'Updates as of $date',
            icon: Icon(Ionicons.ios_airplane),
          ),
          FadeInDown(
            child: Container(
              child: Text(
                data.advisory.message,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: FlareActor(
              "assets/flar/plane.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: 'Animations',
            ),
          ),
        ],
      ),
    );
  }
}
