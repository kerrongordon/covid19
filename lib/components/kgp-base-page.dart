import 'dart:ui';

import 'package:flutter/material.dart';

class KgpBasePage extends StatelessWidget {
  final String title;
  final Widget background;
  final Widget scrollList;
  final List<Widget> actions;
  final List<Widget> children;
  final double expandedHeight;
  final Color backgroundColor;
  final SliverChildDelegate sliverList;
  final bool neverScroll;
  final Widget leading;

  const KgpBasePage({
    Key key,
    this.expandedHeight,
    this.actions,
    this.background,
    this.title,
    this.children,
    this.scrollList,
    this.sliverList,
    this.backgroundColor,
    this.neverScroll,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return CustomScrollView(
      physics: neverScroll == true
          ? NeverScrollableScrollPhysics()
          : AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: expandedHeight != null
              ? expandedHeight
              : mediaQuery.size.height / 2.8,
          pinned: true,
          floating: false,
          elevation: 0.0,
          leading: leading,
          actions: actions,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(bottom: 0),
            background: background,
            title: _titleUi(context, theme),
            centerTitle: true,
          ),
        ),
        sliverList == null
            ? SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: children,
                  ),
                ),
              )
            : SliverList(delegate: sliverList)
      ],
    );
  }

  Stack _titleUi(BuildContext context, ThemeData theme) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 100,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7,
                sigmaY: 7,
              ),
              child: Container(
                color: theme.backgroundColor.withOpacity(0.6),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: Container(),
              ),
              Flexible(
                flex: 4,
                child: Text(
                  title != null ? title : '',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
