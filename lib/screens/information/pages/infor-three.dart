import 'package:flutter/material.dart';

class InforThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 70),
        ListTile(
          title: Text(
            'Avoid close contact with people who are sick',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Stay home as much as possible',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
          trailing: Image.asset('assets/three.png'),
        ),
        ListTile(
          title: Text(
            'Put distance between yourself and other people.',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Remember that some people without symptoms may be able to spread virus.',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Keeping distance from others is especially important for people who are at higher risk of getting very sick.',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
