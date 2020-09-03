import 'package:flutter/material.dart';

// Know How it Spreads
class InforOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 70),
        ListTile(
          title: Text(
            'There is currently no vaccine to prevent coronavirus disease 2019 (COVID-19).',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
        ListTile(
          trailing: Image.asset('assets/one.png'),
          title: Text(
            'The best way to prevent illness is to avoid being exposed to this virus.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'The virus is thought to spread mainly from person-to-person.',
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
                  'Between people who are in close contact with one another (within about 6 feet).',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Through respiratory droplets produced when an infected person coughs, sneezes or talks.',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'These droplets can land in the mouths or noses of people who are nearby or possibly be inhaled into the lungs.',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Some recent studies have suggested that COVID-19 may be spread by people who are not showing symptoms.',
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
