import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class KgpSearchStates extends StatelessWidget {
  final List<UsStates> list;
  final void Function(UsStates item) onTap;

  KgpSearchStates({this.list, this.onTap});

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
              item.state,
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
