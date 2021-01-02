import 'package:covid19/providers/home-provider.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardingProvider = StateNotifierProvider.autoDispose<BoardingNotifier>(
    (_) => BoardingNotifier());

class BoardingNotifier extends StateNotifier<int> {
  BoardingNotifier() : super(0);
  void changePages(int number) => state = number;
}

final boardingController =
    StateNotifierProvider.autoDispose<BoardingController>((ref) {
  final page = ref.watch(boardingProvider.state);
  return BoardingController(pageIndex: page);
});

class BoardingController extends StateNotifier<PageController> {
  BoardingController({int pageIndex}) : super(PageController(initialPage: 0));

  void onTapIcon(int index) {
    state.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void ready({int index, HomeProvider home}) {
    state.addListener(() {
      if (index == 5) {
        if (home.item.country == null) return onTapIcon(4);
      }
    });
  }
}
