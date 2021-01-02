import 'package:covid19/components/card-component.dart';
import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class UsStatesList extends StatelessWidget {
  final List<UsStates> data;
  const UsStatesList({this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final item = data[index];
        final theme = Theme.of(context);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CardComponent(
            onTap: () =>
                Navigator.of(context).pushNamed(usState, arguments: item),
            child: ListTile(
              leading: Icon(
                Ionicons.ios_pie,
                color: Colors.lightBlue,
              ),
              title: Text(
                item.state,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: theme.textTheme.bodyText1.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: CommaUtil.use(item.cases),
                      style: TextStyle(
                        color: theme.textTheme.bodyText1.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Ionicons.ios_analytics,
                          color: theme.accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
