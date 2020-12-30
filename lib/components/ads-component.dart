import 'dart:async';

import 'package:covid19/components/card-component.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

class AdsComponent extends StatefulWidget {
  final NativeAdmobType type;
  final Color color;
  const AdsComponent({this.type, this.color});

  @override
  _AdsComponentState createState() => _AdsComponentState();
}

class _AdsComponentState extends State<AdsComponent> {
  static const _adUnitID = 'ca-app-pub-5675929973866541/7003986965';
  final _nativeAdController = NativeAdmobController();
  double _height = 0;

  StreamSubscription _subscription;

  @override
  void initState() {
    _nativeAdController.setTestDeviceIds(['D1A9FB043D5B3B683FFB73575B9C8AD8']);
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    _nativeAdController.dispose();
    super.dispose();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height = widget.type == NativeAdmobType.full ? 350 : 150;
        });
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyText1.color;
    return Container(
      height: _height,
      child: CardComponent(
        color: widget.color,
        padding: const EdgeInsets.all(20),
        child: NativeAdmob(
          adUnitID: _adUnitID,
          controller: _nativeAdController,
          loading: Container(),
          error: Container(),
          type: widget.type,
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
            ratingColor: ColorTheme.cases,
            showMediaContent: true,
          ),
        ),
      ),
    );
  }
}
