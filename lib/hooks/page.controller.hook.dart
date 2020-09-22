import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Creates an [PageController] automatically disposed.
///
/// [initialPage], [viewportFraction] and [keepPage] are ignored after the first call.
///
/// See also:
///   * [PageController]
PageController usePageController({
  int initialPage = 0,
  double viewportFraction = 1.0,
  bool keepPage = true,
  List keys,
}) {
  return use(_PageControllerHook(
    initialPage: initialPage,
    viewportFraction: viewportFraction,
    keepPage: keepPage,
    keys: keys,
  ));
}

class _PageControllerHook extends Hook<PageController> {
  final int initialPage;
  final double viewportFraction;
  final bool keepPage;

  const _PageControllerHook({
    this.initialPage,
    this.viewportFraction,
    this.keepPage,
    List keys,
  }) : super(keys: keys);

  @override
  _PageControllerHookState createState() => _PageControllerHookState();
}

class _PageControllerHookState
    extends HookState<PageController, _PageControllerHook> {
  PageController _pageController;

  @override
  void initHook() => _pageController = PageController(
        initialPage: hook.initialPage,
        keepPage: hook.keepPage,
        viewportFraction: hook.viewportFraction,
      );

  @override
  PageController build(BuildContext context) => _pageController;

  @override
  void dispose() => _pageController.dispose();
}
