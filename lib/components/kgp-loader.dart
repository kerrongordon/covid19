import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class KgpLoader extends StatelessWidget {
  final double hightDiv;

  const KgpLoader({Key key, this.hightDiv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final double hight = hightDiv ?? 3;
    return SizedBox(
      height: mediaQuery.size.height / hight,
      child: Center(
        child: RepaintBoundary(
          child: LoadingBouncingGrid.circle(
            backgroundColor: theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
