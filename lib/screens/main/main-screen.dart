import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/country-card/country-card-today.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:covid19/screens/main/contact-card-list.dart';
import 'package:covid19/screens/main/main-callback.dart';
import 'package:covid19/screens/main/main-flag.dart';
import 'package:covid19/screens/main/main.card.one.dart';
import 'package:covid19/screens/main/providers/main-provider.dart';
import 'package:covid19/translations/app-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final homeData = useProvider(mainScreenProvider);
    useAutomaticKeepAliveClient();

    return homeData.when(
      error: (error, _) => KgpCenter(child: Text(error.toString())),
      loading: () => const KgpCenter(child: KgpLoader()),
      data: (data) => Scaffold(
        body: KgpBasePage(
          title: data.country,
          background: MainFlag(data: data),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                MainCardOne(data: data),
                const ContactCardList(),
                FadeInUp(child: CountryCardToday(data: data)),
                const AdsComponent(type: NativeAdmobType.banner),
                MainCallback(data: data),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 60),
          child: ZoomIn(
            child: FloatingActionButton.extended(
                heroTag: 'openMap',
                label: Text(map),
                icon: const Icon(Ionicons.ios_map),
                onPressed: () => Navigator.of(context).pushNamed(mapScreen)),
          ),
        ),
      ),
    );
  }
}
