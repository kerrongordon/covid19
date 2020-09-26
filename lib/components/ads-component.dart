import 'package:covid19/components/card-component.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdsComponent extends StatelessWidget {
  const AdsComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placementId = DotEnv().env['PLACEMENT_ID'];

    if (placementId == null) return Container();

    final theme = Theme.of(context);

    return Container(
      child: CardComponent(
        padding: const EdgeInsets.all(0),
        child: FacebookNativeAd(
          height: 120,
          placementId: placementId,
          adType: NativeAdType.NATIVE_BANNER_AD,
          bannerAdSize: NativeBannerAdSize.HEIGHT_120,
          width: double.infinity,
          backgroundColor: theme.cardTheme.color,
          titleColor: theme.textTheme.bodyText1.color,
          descriptionColor: theme.textTheme.bodyText1.color,
          buttonColor: theme.accentColor,
          buttonTitleColor: Colors.white,
          buttonBorderColor: theme.accentColor,
          // keepExpandedWhileLoading: false,
          // expandAnimationDuraion: 400,
          isMediaCover: true,
        ),
      ),
    );
  }
}
