import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class KgpFlag extends StatelessWidget {
  final Object tag;
  final String imageUrl;
  final double imageWidth;
  final double imageHeight;
  const KgpFlag({
    Key key,
    this.tag,
    @required this.imageUrl,
    @required this.imageWidth,
    @required this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tag == null
        ? imageBuilderUi()
        : Hero(tag: tag, child: imageBuilderUi());
  }

  CachedNetworkImage imageBuilderUi() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: imageWidth,
        height: imageHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => Container(
        child: const CircularProgressIndicator(strokeWidth: 2.0),
        width: imageWidth,
        height: imageHeight,
      ),
    );
  }
}
