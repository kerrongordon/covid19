import 'package:covid19/components/kgp-flag.dart';
import 'package:covid19/components/kgp-icon-button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BoardingSlide extends StatelessWidget {
  final String title;
  final String subtitle;
  final String lottie;
  final String flag;
  final String buttonTitle;
  final Widget buttonIcon;
  final bool repeat;
  final void Function() onPressed;
  const BoardingSlide({
    Key key,
    this.title,
    this.subtitle,
    this.lottie,
    this.buttonTitle,
    this.buttonIcon,
    this.onPressed,
    this.flag,
    this.repeat = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          lottie != null
              ? Container(
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Lottie.asset(
                      'assets/lottiefiles/$lottie.json',
                      repeat: repeat,
                      animate: true,
                      height: mediaQuery.size.width / 2,
                    ),
                  ),
                )
              : Container(),
          flag != null && lottie == null
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: KgpFlag(
                      tag: null,
                      imageUrl: flag,
                      imageHeight: mediaQuery.size.width / 2.5,
                      imageWidth: mediaQuery.size.width / 2.5,
                    ),
                  ),
                )
              : Container(),
          title != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Container(),
          subtitle != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Container(),
          onPressed != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: KgpIconButton(
                    buttonTitle: buttonTitle,
                    buttonIcon: buttonIcon,
                    onPressed: onPressed,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
