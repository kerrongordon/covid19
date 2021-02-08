import 'package:covid19/components/kgp-blur.dart';
import 'package:flutter/material.dart';

class KgpBasePage extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget background;
  final Widget scrollList;
  final List<Widget> actions;
  final double expandedHeight;
  final Color backgroundColor;
  final SliverChildDelegate sliverList;
  final bool neverScroll;
  final Widget leading;

  const KgpBasePage({
    this.expandedHeight,
    this.actions,
    this.background,
    this.title,
    this.scrollList,
    this.sliverList,
    this.backgroundColor,
    this.neverScroll,
    this.leading,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return CustomScrollView(
      physics: neverScroll == true
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: expandedHeight ?? mediaQuery.size.height / 2.8,
          pinned: true,
          elevation: 0.0,
          leading: leading,
          actions: actions,
          flexibleSpace: FlexibleSpaceBar(
            background: background,
            title: _titleUi(context, theme),
            centerTitle: true,
          ),
        ),
        if (sliverList == null)
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: child,
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60),
            sliver: SliverList(delegate: sliverList),
          ),
      ],
    );
  }

  Stack _titleUi(BuildContext context, ThemeData theme) {
    return Stack(
      children: [
        KgpBlur(),
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
                  title ?? '',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              Flexible(
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
