import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';

class InforFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Cover your mouth and nose',
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: CardComponent(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'You could spread COVID-19 to others even if you do not feel sick.',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Everyone should wear a cloth face cover when they have to go out in public, for example to the grocery store or to pick up other necessities.',
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
                            'Cloth face coverings should not be placed on young children under age 2, anyone who has trouble breathing, or is unconscious, incapacitated or otherwise unable to remove the mask without assistance.',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                          trailing: Hero(
                            tag: 4,
                            child: Image.asset('assets/four.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'The cloth face cover is meant to protect other people in case you are infected.',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Continue to keep about 6 feet between yourself and others. The cloth face cover is not a substitute for social distancing.',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
