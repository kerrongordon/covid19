import 'package:hooks_riverpod/hooks_riverpod.dart';

final tabProvider =
    StateNotifierProvider.autoDispose<TabNotifier>((_) => TabNotifier());

class TabNotifier extends StateNotifier<int> {
  TabNotifier() : super(2);
  Future<void> changePages(int number) async => state = number;
}
