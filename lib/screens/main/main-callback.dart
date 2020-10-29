import 'package:covid19/components/kgp-icon-button.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainCallback extends StatelessWidget {
  final Country data;
  const MainCallback({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 20,
      ),
      child: KgpIconButton(
        buttonTitle: 'View More',
        buttonIcon: const Icon(Ionicons.ios_folder_open),
        onPressed: () =>
            Navigator.of(context).pushNamed(countryScreen, arguments: data),
      ),
    );
  }
}
