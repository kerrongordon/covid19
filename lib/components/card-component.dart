import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class CardComponent extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function() onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const CardComponent({
    this.color,
    @required this.child,
    this.onTap,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeInUp(
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: color ?? theme.cardTheme.color,
        elevation: 20,
        shadowColor: color != null
            ? color.withOpacity(0.9)
            : Colors.black.withOpacity(0.4),
        margin: margin ?? const EdgeInsets.only(bottom: 20, top: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          splashColor: theme.primaryColor,
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(0),
            child: child,
          ),
        ),
      ),
    );
  }
}
