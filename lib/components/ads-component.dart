// import 'dart:async';

import 'package:covid19/components/card-component.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

class AdsComponent extends HookWidget {
  final NativeAdmobType type;
  const AdsComponent({this.type});

  static const _adUnitID = 'ca-app-pub-5675929973866541/7003986965';
  static const testDevice = ['D1A9FB043D5B3B683FFB73575B9C8AD8'];

  @override
  Widget build(BuildContext context) {
    final _height = useState(0.0);
    final _nativeAdmobController = useState(NativeAdmobController());
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyText1.color;

    void _onStateChanged(AdLoadState state) {
      switch (state) {
        case AdLoadState.loading:
          _height.value = 0;
          break;
        case AdLoadState.loadCompleted:
          _height.value = type == NativeAdmobType.full ? 350 : 150;
          break;
        case AdLoadState.loadError:
          _height.value = 0;
          break;
      }
    }

    _nativeAdmobController.value.setTestDeviceIds(testDevice);

    useEffect(() {
      final _subscription =
          _nativeAdmobController.value.stateChanged.listen(_onStateChanged);
      return () => _subscription.cancel();
    }, [_nativeAdmobController.value.stateChanged]);

    return SizedBox(
      height: _height.value,
      child: CardComponent(
        padding: const EdgeInsets.all(20),
        child: NativeAdmob(
          adUnitID: _adUnitID,
          controller: _nativeAdmobController.value,
          loading: Container(),
          error: Container(),
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
            ratingColor: ColorTheme.cases,
          ),
        ),
      ),
    );
  }
}
