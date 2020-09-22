import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferencesProvider = FutureProvider.autoDispose(
  (_) async => await SharedPreferences.getInstance(),
);

class PreferencesProvider {
  Future<SharedPreferences> loadPrefer() async =>
      await SharedPreferences.getInstance();
}
