import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function() onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const CardComponent({
    Key key,
    this.color,
    @required this.child,
    this.onTap,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      color: color ?? theme.cardTheme.color,
      elevation: 30,
      shadowColor: Colors.black.withOpacity(0.3),
      margin: margin ?? const EdgeInsets.only(bottom: 20, top: 10),
      child: InkWell(
        splashColor: theme.primaryColor,
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: child,
        ),
      ),
    );
  }
}
