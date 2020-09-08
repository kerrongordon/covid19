import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class KgpBottomDialog extends StatelessWidget {
  final String title;
  final Widget child;
  const KgpBottomDialog({
    Key key,
    this.child,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            child,
          ],
        ),

        // Stack(
        //   children: [
        //     // Padding(
        //     //   padding: const EdgeInsets.all(20),
        //     //   child: child,
        //     // ),
        //     // Positioned(
        //     //   top: 0,
        //     //   left: 0,
        //     //   right: 0,
        //     //   height: 80,
        //     //   child: ClipRect(
        //     //     child: BackdropFilter(
        //     //       filter: ImageFilter.blur(
        //     //         sigmaX: 8,
        //     //         sigmaY: 8,
        //     //       ),
        //     //       child: Container(
        //     //         color: Theme.of(context).cardTheme.color.withOpacity(0.7),
        //     //       ),
        //     //     ),
        //     //   ),
        //     // ),
        //     // Container(
        //     //   padding: const EdgeInsets.all(20),
        //     //   child: Row(
        //     //     children: [
        //     //       Text(
        //     //         title ?? '',
        //     //         style: TextStyle(
        //     //           fontSize: 20,
        //     //           fontWeight: FontWeight.w700,
        //     //         ),
        //     //         overflow: TextOverflow.ellipsis,
        //     //       ),
        //     //       Spacer(),
        //     //       IconButton(
        //     //         color: Theme.of(context).accentColor,
        //     //         visualDensity: VisualDensity.compact,
        //     //         icon: Icon(Ionicons.ios_close_circle_outline),
        //     //         onPressed: () => Navigator.pop(context),
        //     //       )
        //     //     ],
        //     //   ),
        //     // ),
        //   ],
        // ),
      ),
    );
  }
}
