import 'package:flutter/material.dart';

class BoardingIndicator extends StatelessWidget {
  final bool toggle;
  final void Function() onTap;
  const BoardingIndicator({
    Key key,
    this.toggle = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          height: 8,
          width: toggle ? 30 : 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: toggle ? Colors.white : Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
