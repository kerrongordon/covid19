import 'package:flutter/material.dart';

class KgpSearchNotFound extends StatelessWidget {
  const KgpSearchNotFound({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'No Result Found... 👀',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
