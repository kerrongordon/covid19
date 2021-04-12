import 'package:covid19/providers/home-provider.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardingProvider =
    StateNotifierProvider.autoDispose<BoardingNotifier, int>(
        (_) => BoardingNotifier());

class BoardingNotifier extends StateNotifier<int> {
  BoardingNotifier() : super(0);
  Future<void> changePages(int number) async => state = number;
}

final boardingController =
    StateNotifierProvider.autoDispose<BoardingController, PageController>(
        (ref) {
  return BoardingController();
});

class BoardingController extends StateNotifier<PageController> {
  BoardingController() : super(PageController());

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
