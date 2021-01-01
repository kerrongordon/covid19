import 'package:flutter/material.dart';

class KgpCardTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final Color color;
  const KgpCardTitle({
    this.title,
    this.subtitle,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title ?? '',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: color ?? theme.textTheme.bodyText1.color,
                  ),
                ),
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: icon,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          subtitle != null
              ? Text(
                  subtitle ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: color,
                  ),
                )
              : Container(),
          subtitle != null ? const SizedBox(height: 25) : Container(),
        ],
      ),
    );
  }
}
