import 'package:covid19/translations/boarding-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BoardingStartButton extends StatelessWidget {
  final void Function() onPressed;
  const BoardingStartButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.backgroundColor,
      child: Container(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 20,
        ),
        child: TextButton.icon(
          clipBehavior: Clip.antiAlias,
          onPressed: onPressed,
          icon: const Icon(
            Ionicons.ios_checkmark_circle,
            color: Colors.white,
          ),
          label: Text(
            startbutton,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              theme.accentColor,
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
