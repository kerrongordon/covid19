import 'package:flutter/material.dart';

class KgpBasePage extends StatelessWidget {
  final String title;
  final Widget background;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: expandedHeight != null ? expandedHeight : 300,
          pinned: true,
          floating: false,
          elevation: 3.0,
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
