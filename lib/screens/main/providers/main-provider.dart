import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/home-provider.dart';
import 'package:covid19/providers/one-country-provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainScreenProvider = FutureProvider.autoDispose<Country>((ref) async {
  final home = ref.watch(homeCountryProvider);
  final getcountry = ref.watch(oneCountryProvider);
  final homeName = await home.getCountryName();
  return await getcountry.getOneCountryApi(country: homeName);
});
