import 'package:flutter/material.dart';

class KgpBasePage extends StatelessWidget {
  final String title;
  final Widget background;
  final Widget scrollList;
  final Widget persistentHeader;
  final List<Widget> actions;
  final List<Widget> children;
  final double expandedHeight;

  const KgpBasePage({
    Key key,
    this.expandedHeight,
    this.actions,
    this.background,
    this.title,
    @required this.children,
    this.persistentHeader,
    this.scrollList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: expandedHeight != null ? expandedHeight : 300,
          pinned: true,
          floating: false,
          elevation: 0.0,
          actions: actions,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(bottom: 8),
            background: background,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  flex: 4,
                  child: Container(),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    title != null ? title : '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),
        persistentHeader != null
            ? SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: Delegate(child: persistentHeader),
              )
            : SliverToBoxAdapter(),
        SliverToBoxAdapter(
          child: Container(
            child: Column(
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  Delegate({this.child});
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
        color: Theme.of(context).backgroundColor,
        child: child,
      );

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 69;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
