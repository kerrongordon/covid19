import 'package:avatar_glow/avatar_glow.dart';
import 'package:covid19/components/kgp-flag.dart';
import 'package:covid19/components/kgp-icon-button.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class BoardingSlide extends StatelessWidget {
  final String title;
  final String subtitle;
  final String flar;
  final String flarAnimationName;
  final String flag;
  final String buttonTitle;
  final Widget buttonIcon;
  final void Function() onPressed;
  const BoardingSlide({
    Key key,
    this.title,
    this.subtitle,
    this.buttonTitle,
    this.buttonIcon,
    this.onPressed,
    this.flag,
    this.flar,
    this.flarAnimationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      color: theme.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          flar != null
              ? Container(
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: FlareActor(
                      "assets/flar/$flar.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: flarAnimationName,
                    ),
                  ),
                )
              : Container(),
          flag != null && flar == null
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: AvatarGlow(
                      animate: true,
                      glowColor: ColorTheme.primary,
                      endRadius: 130.0,
                      duration: const Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      child: Material(
                        elevation: 0,
                        shape: CircleBorder(),
                        child: KgpFlag(
                          tag: null,
                          imageUrl: flag,
                          imageHeight: mediaQuery.size.width / 2.5,
                          imageWidth: mediaQuery.size.width / 2.5,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          title != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FadeInDown(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container(),
          subtitle != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FadeInUp(
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container(),
          onPressed != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: FadeInUp(
                    child: KgpIconButton(
                      buttonTitle: buttonTitle,
                      buttonIcon: buttonIcon,
                      onPressed: onPressed,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
