import 'package:covid19/models/historical-model.dart';
import 'package:covid19/providers/historical-provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final thirtyDayProvider = FutureProvider.autoDispose
    .family<Historical, String>((ref, countryName) async {
  final historical = ref.watch(historicalProvider);
  return await historical.getHistoricalApi(country: countryName);
});
