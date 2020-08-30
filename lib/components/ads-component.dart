// import 'package:covid19/components/card-component.dart';
// import 'package:facebook_audience_network/facebook_audience_network.dart';
// import 'package:flutter/material.dart';

// class AdsComponent extends StatelessWidget {
//   const AdsComponent({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: CardComponent(
//         child: FacebookNativeAd(
//           height: 100,
//           placementId: "",
//           adType: NativeAdType.NATIVE_BANNER_AD,
//           bannerAdSize: NativeBannerAdSize.HEIGHT_100,
//           width: double.infinity,
//           backgroundColor: Theme.of(context).cardTheme.color,
//           titleColor: Theme.of(context).textTheme.bodyText1.color,
//           descriptionColor: Theme.of(context).textTheme.bodyText1.color,
//           buttonColor: Theme.of(context).accentColor,
//           buttonTitleColor: Colors.white,
//           buttonBorderColor: Theme.of(context).accentColor,
//           listener: (result, value) {
//             print("Native Ad: $result --> $value");
//           },
//         ),
//       ),
//     );
//   }
// }
