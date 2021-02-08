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
        children: [
          if (flar != null)
            AspectRatio(
              aspectRatio: 1.5,
              child: FlareActor(
                'assets/flar/$flar.flr',
                animation: flarAnimationName,
              ),
            )
          else
            Container(),
          if (flag != null && flar == null)
            Padding(
              padding: const EdgeInsets.all(20),
              child: AvatarGlow(
                glowColor: ColorTheme.primary,
                endRadius: 130.0,
                child: Material(
                  shape: const CircleBorder(),
                  child: KgpFlag(
                    imageUrl: flag,
                    imageHeight: mediaQuery.size.width / 2.5,
                    imageWidth: mediaQuery.size.width / 2.5,
                  ),
                ),
              ),
            )
          else
            Container(),
          if (title != null)
            Padding(
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
          else
            Container(),
          if (subtitle != null)
            Padding(
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
          else
            Container(),
          if (onPressed != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FadeInUp(
                child: KgpIconButton(
                  buttonTitle: buttonTitle,
                  buttonIcon: buttonIcon,
                  onPressed: onPressed,
                ),
              ),
            )
          else
            Container(),
        ],
      ),
    );
  }
}
