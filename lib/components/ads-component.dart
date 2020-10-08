import 'package:covid19/components/card-component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

class AdsComponent extends StatefulWidget {
  const AdsComponent({
    Key key,
    @required this.type,
  }) : super(key: key);

  final NativeAdmobType type;

  @override
  _AdsComponentState createState() => _AdsComponentState();
}

class _AdsComponentState extends State<AdsComponent> {
  final controller = NativeAdmobController();
  bool ready = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {
      if (mounted) setState(() => ready = true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyText1.color;

    return Visibility(
      visible: ready,
      maintainState: true,
      maintainAnimation: true,
      replacement: Container(),
      child: CardComponent(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: widget.type == NativeAdmobType.full ? 350 : 60,
          child: NativeAdmob(
            adUnitID: kDebugMode
                ? 'ca-app-pub-3940256099942544/2247696110'
                : 'ca-app-pub-5675929973866541/7003986965',
            loading: Center(child: CircularProgressIndicator(strokeWidth: 2.0)),
            error: Container(height: 0),
            controller: controller,
            type: widget.type,
            options: NativeAdmobOptions(
              ratingColor: Colors.red,
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
