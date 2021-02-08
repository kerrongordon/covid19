import 'package:covid19/models/country-model.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class KgpSearchList extends StatelessWidget {
  final List<Country> list;
  final void Function(Country item) onTap;

  const KgpSearchList({this.list, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(height: 0),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return ListTile(
          title: Text(
            item.country,
            style: const TextStyle(fontSize: 18),
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
    );
  }
}
