import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

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
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          FadeInUp(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title ?? '',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: theme.textTheme.bodyText1.color,
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
          ),
          const Divider(),
          subtitle != null
              ? FadeInDown(
                  child: Text(
                    subtitle ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              : Container(),
          subtitle != null ? const SizedBox(height: 25) : Container(),
        ],
      ),
    );
  }
}
