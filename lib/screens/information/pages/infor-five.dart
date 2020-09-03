import 'package:flutter/material.dart';

class InforFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 70),
        ListTile(
          title: Text(
            'If you are in a private setting and do not have on your cloth face covering, remember to always cover your mouth and nose with a tissue when you cough or sneeze or use the inside of your elbow.',
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
          ),
        ),
        ListTile(
          title: Text(
            'Throw used tissues in the trash.',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
          trailing: Image.asset('assets/five.png'),
        ),
        ListTile(
          title: Text(
            'Immediately wash your hands with soap and water for at least 20 seconds. If soap and water are not readily available, clean your hands with a hand sanitizer that contains at least 60% alcohol.',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
      ],
    );
  }
}
