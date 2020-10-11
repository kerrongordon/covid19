import 'package:covid19/components/card-component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

class AdsComponent extends StatelessWidget {
  final NativeAdmobType type;
  const AdsComponent({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyText1.color;

    return RepaintBoundary(
      child: CardComponent(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: type == NativeAdmobType.full ? 350 : 60,
          child: NativeAdmob(
            adUnitID: kDebugMode
                ? 'ca-app-pub-3940256099942544/2247696110'
                : 'ca-app-pub-5675929973866541/7003986965',
            loading: const Center(
              child: const CircularProgressIndicator(strokeWidth: 2.0),
            ),
            error: Container(height: 0),
            type: type,
            options: NativeAdmobOptions(
              callToActionStyle: NativeTextStyle(
                backgroundColor: theme.accentColor,
                fontSize: 12,
              ),
              adLabelTextStyle: NativeTextStyle(color: textColor),
              bodyTextStyle: NativeTextStyle(color: textColor),
              headlineTextStyle: NativeTextStyle(color: textColor),
              advertiserTextStyle: NativeTextStyle(color: textColor),
              priceTextStyle: NativeTextStyle(color: textColor),
              storeTextStyle: NativeTextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
