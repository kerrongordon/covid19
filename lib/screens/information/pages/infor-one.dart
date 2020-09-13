import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InforOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Know How it Spreads',
        expandedHeight: 55,
        children: <Widget>[
          Lottie.asset(
            'assets/prueba-doctores-freepik.json',
            repeat: true,
            animate: true,
            height: 300,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: CardComponent(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'There is currently no vaccine to prevent coronavirus disease 2019 (COVID-19).',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Hero(
                      tag: 1,
                      child: Image.asset('assets/one.png'),
                    ),
                    title: Text(
                      'The best way to prevent illness is to avoid being exposed to this virus.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.3,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'The virus is thought to spread mainly from person-to-person.',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Between people who are in close contact with one another (within about 6 feet).',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Through respiratory droplets produced when an infected person coughs, sneezes or talks.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'These droplets can land in the mouths or noses of people who are nearby or possibly be inhaled into the lungs.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Some recent studies have suggested that COVID-19 may be spread by people who are not showing symptoms.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: AdsComponent(),
          // ),
        ],
      ),
    );
  }
}
