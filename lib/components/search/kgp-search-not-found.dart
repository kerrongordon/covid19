import 'package:covid19/translations/app-translate.dart';
import 'package:flutter/material.dart';

class KgpSearchNotFound extends StatelessWidget {
  const KgpSearchNotFound({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$messagethree... 👀',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
