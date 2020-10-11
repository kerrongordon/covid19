import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-flag.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/country-screen.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CountriesItem extends StatelessWidget {
  final Country data;
  const CountriesItem({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CardComponent(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CountryScreen(data: data))),
        child: ListTile(
          leading: RepaintBoundary(
            child: KgpFlag(
              tag: data.country,
              imageUrl: data.countryInfo.flag,
              imageWidth: 30.0,
              imageHeight: 30.0,
            ),
          ),
          title: Text(
            data.country,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: theme.textTheme.bodyText1.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: CommaUtil.use(data.cases),
                  style: TextStyle(
                    color: theme.textTheme.bodyText1.color,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Ionicons.ios_pulse,
                      color: theme.accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
