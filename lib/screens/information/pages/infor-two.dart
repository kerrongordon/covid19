import 'package:flutter/material.dart';

class InforTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 70),
        ListTile(
          title: Text(
            'Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'If soap and water are not readily available, use a hand sanitizer that contains at least 60% alcohol. Cover all surfaces of your hands and rub them together until they feel dry.',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
          trailing: Image.asset('assets/two.png'),
        ),
        ListTile(
          title: Text(
            'Avoid touching your eyes, nose, and mouth with unwashed hands.',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
      ],
    );
  }
}
