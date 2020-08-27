import 'package:flutter/material.dart';

class KgpCardTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  const KgpCardTitle({
    Key key,
    this.title,
    this.subtitle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: title ?? '',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: icon,
                ),
              ),
            ]),
          ),
          Divider(),
          Text(
            subtitle ?? '',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
