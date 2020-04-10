import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class KgpLoader extends StatelessWidget {
  final double hightDiv;

  const KgpLoader({Key key, this.hightDiv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _hight = hightDiv == null ? 3 : hightDiv;
    return Container(
      height: MediaQuery.of(context).size.height / _hight,
      child: Center(
        child: LoadingBouncingGrid.circle(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
