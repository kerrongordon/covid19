import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/models/covid-Infor.model.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:flutter/material.dart';

class InforItem extends StatelessWidget {
  const InforItem({
    @required this.data,
    this.index,
  });

  final CovidInfor data;
  final int index;

  @override
  Widget build(BuildContext context) {
    final changeTheme = AdaptiveTheme.of(context);
    final colorText = changeTheme.theme.textTheme.bodyText1.color;

    return CardComponent(
      color:
          changeTheme.mode.isLight ? Color.fromRGBO(21, 140, 166, 1.0) : null,
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2.1,
              child: Image.asset(
                'assets/infor/${data.image}',
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: changeTheme.mode.isLight ? Colors.white54 : null,
            ),
            const SizedBox(height: 10),
            Text(
              data.title ?? '',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: changeTheme.mode.isLight ? Colors.white : colorText,
              ),
            ),
          ],
        ),
      ),
      onTap: () =>
          Navigator.of(context).pushNamed(inforPageScreen, arguments: data),
    );
  }
}
