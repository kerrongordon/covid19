import 'dart:ui';

import 'package:flutter/material.dart';

class KgpBlur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      // height: 100,
      bottom: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7.0,
            sigmaY: 7.0,
          ),
          child: Container(
            color: theme.backgroundColor.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
