import 'package:covid19/components/card-component.dart';
import 'package:covid19/models/vaccine-model.dart';
import 'package:covid19/screens/vaccine/vaccine-item-screen.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_icons/flutter_icons.dart';

class VaccineCardItem extends StatelessWidget {
  final Datum data;
  const VaccineCardItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CardComponent(
        child: ListTile(
          leading: FadeIn(
            child: Icon(
              Ionicons.ios_flask,
              size: 25,
              color: ColorTheme.recovered,
            ),
          ),
          title: FadeInDown(
            child: Text(
              data.candidate,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
          ),
          trailing: FadeInRight(
            child: Icon(
              Ionicons.ios_arrow_forward,
              size: 25,
              color: Theme.of(context).accentColor,
            ),
          ),
          // dense: true,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VaccineItemScreen(data: data),
            ),
          );
        },
      ),
    );
  }
}
