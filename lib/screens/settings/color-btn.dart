import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class ColorBtn extends StatelessWidget {
  final void Function() onPressed;
  final Color fillColor;
  final String title;
  const ColorBtn({
    Key key,
    this.onPressed,
    this.fillColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ZoomIn(
            child: RawMaterialButton(
              onPressed: onPressed,
              elevation: 1,
              fillColor: fillColor,
              splashColor: Theme.of(context).accentColor,
              child: Container(),
              padding: EdgeInsets.all(30.0),
              shape: CircleBorder(),
            ),
          ),
          SizedBox(height: 10),
          FadeInUp(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
