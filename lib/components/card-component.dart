import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Color color;
  final Widget child;
  const CardComponent({
    Key key,
    this.color,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Theme.of(context).cardTheme.color,
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 20, top: 5),
      child: child,
    );
  }
}
