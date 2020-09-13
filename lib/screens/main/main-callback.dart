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
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 20,
      ),
      child: RaisedButton.icon(
        elevation: 5,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
          bottom: 5,
        ),
        color: theme.accentColor,
        textColor: Colors.white,
        icon: Icon(Ionicons.ios_folder_open),
        label: const Text('View More'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
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
