import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class KgpStatsWithTitle extends StatelessWidget {
  final int amount;
  final String title;
  final bool flip;
  final Color titlecolor;
  final Color amountcolor;
  final double titleFontSize;
  final double amountFontSize;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const KgpStatsWithTitle({
    Key key,
    this.title,
    this.titlecolor,
    this.titleFontSize,
    this.amount,
    this.amountFontSize,
    this.amountcolor,
    this.padding,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.flip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        padding: padding,
        child: Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            flip != null
                ? FadeInUp(child: _titleUi())
                : FadeInDown(child: _amountUi()),
            const SizedBox(height: 10),
            flip != null
                ? FadeInDown(child: _amountUi())
                : FadeInUp(child: _titleUi()),
          ],
        ),
      ),
    );
  }

  Widget _amountUi() {
    return AutoSizeText(
      CommaUtil.use(amount),
      style: TextStyle(
        color: amountcolor,
        fontSize: amountFontSize,
        fontWeight: FontWeight.w300,
      ),
      maxLines: 1,
    );
  }

  Widget _titleUi() {
    return AutoSizeText(
      title,
      style: TextStyle(
        color: titlecolor,
        fontSize: titleFontSize,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
    );
  }
}
