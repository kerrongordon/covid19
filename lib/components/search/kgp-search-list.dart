import 'package:covid19/models/country-model.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class KgpSearchList extends StatelessWidget {
  final List<Country> list;
  final void Function(Country item) onTap;

  KgpSearchList({this.list, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(height: 0),
        itemCount: list.length,
        itemBuilder: (context, int) {
          final item = list[int];
          return ListTile(
            title: Text(
              item.country,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              CommaUtil.use(item.cases),
              style: TextStyle(
                color: theme.textTheme.bodyText1.color,
              ),
            ),
            trailing: Icon(
              Ionicons.ios_arrow_forward,
              color: theme.textTheme.bodyText1.color,
            ),
            dense: true,
            onTap: () => onTap(item),
          );
        },
      ),
    );
  }
}
