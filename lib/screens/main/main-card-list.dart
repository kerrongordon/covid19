import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/country-card/country-card-today.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/main/main-callback.dart';
import 'package:covid19/screens/main/main.card.one.dart';
import 'package:flutter/material.dart';

class MainCardList extends StatelessWidget {
  final Country data;
  const MainCardList({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return KgpBasePage(
      title: data.country,
      background: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: RepaintBoundary(
              child: CachedNetworkImage(
                imageUrl: data.countryInfo.flag,
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(),
                placeholder: (context, url) => Container(),
              ),
            ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            top: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                color: theme.backgroundColor.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, theme.backgroundColor],
                ),
              ),
            ),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            MainCardOne(data: data),
            CountryCardToday(data: data),
            MainCallback(data: data),
          ],
        ),
      ),
    );
  }
}
