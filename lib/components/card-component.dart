import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function() onTap;
  const CardComponent({
    Key key,
    this.color,
    @required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: color ?? Theme.of(context).cardTheme.color,
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 20, top: 5),
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
