import 'package:covid19/components/kgp-icon-button.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/country-screen.dart';
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
        buttonIcon: Icon(Ionicons.ios_folder_open),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryScreen(data: data),
          ),
        ),
      ),
    );
  }
}
