import 'package:flutter/material.dart';

class InforSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 70),
        ListTile(
          title: Text(
            'Clean AND disinfect frequently touched surfaces daily. This includes tables, doorknobs, light switches, countertops, handles, desks, phones, keyboards, toilets, faucets, and sinks.',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
          trailing: Image.asset('assets/six.png'),
        ),
        ListTile(
          title: Text(
            'If surfaces are dirty, clean them: Use detergent or soap and water prior to disinfection.',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
      ],
    );
  }
}
