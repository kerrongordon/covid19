import 'package:hooks_riverpod/hooks_riverpod.dart';

final tabProvider =
    StateNotifierProvider.autoDispose<TabNotifier>((_) => TabNotifier());

class TabNotifier extends StateNotifier<int> {
  TabNotifier() : super(2);
  void changePages(int number) => state = number;
}
