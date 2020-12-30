import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/models/travel-alert-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryCardTravelAlert extends HookWidget {
  final Datum data;
  const CountryCardTravelAlert({
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat.yMMMMEEEEd().format(data.advisory.updated);
    final url = data.advisory.source;

    return CardComponent(
      color: Colors.blue,
      onTap: () async => await canLaunch(url)
          ? await launch(url)
          : throw 'Could not launch $url',
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          KgpCardTitle(
            title: 'Travel Alert',
            subtitle: 'Updated as of $date',
            color: Colors.white,
            icon: const Icon(
              Ionicons.ios_airplane,
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Container(
                child: Text(
                  data.advisory.message,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  'Read More',
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
