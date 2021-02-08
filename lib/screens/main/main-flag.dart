import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/models/country-model.dart';
import 'package:flutter/material.dart';

class MainFlag extends StatelessWidget {
  const MainFlag({
    @required this.data,
  });

  final Country data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
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
    );
  }
}
