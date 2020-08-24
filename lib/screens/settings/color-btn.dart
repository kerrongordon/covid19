import 'package:flutter/material.dart';

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
          RawMaterialButton(
            onPressed: onPressed,
            elevation: 1,
            fillColor: fillColor,
            splashColor: Theme.of(context).accentColor,
            child: Container(),
            padding: EdgeInsets.all(35.0),
            shape: CircleBorder(),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
