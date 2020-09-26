import 'package:flutter/material.dart';

class KgpCenter extends StatelessWidget {
  final Widget child;
  const KgpCenter({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
