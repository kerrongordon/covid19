import 'package:flutter/material.dart';

class KgpIconButton extends StatelessWidget {
  final String buttonTitle;
  final Widget buttonIcon;
  final void Function() onPressed;
  const KgpIconButton({
    Key key,
    @required this.buttonTitle,
    @required this.buttonIcon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: buttonIcon,
      label: Text(
        buttonTitle ?? 'Change Title',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 10),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            color: Colors.white,
          ),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );

    // return FlatButton.icon(
    // padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 10),
    // color: Theme.of(context).accentColor,
    // textColor: Colors.white,
    // icon: buttonIcon,
    // label: Text(
    //   buttonTitle ?? 'Change Title',
    //   style: const TextStyle(
    //     fontSize: 16,
    //   ),
    // ),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(5.0),
    // ),
    // onPressed: onPressed,
    // );
  }
}
