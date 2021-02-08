import 'package:covid19/models/historical-model.dart';
import 'package:covid19/providers/historical-provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum HistoryItemType { cases, recovered, deaths }

class CountryAndType {
  final String countryName;
  final HistoryItemType historyItemType;

  const CountryAndType({
    this.countryName,
    this.historyItemType,
  });
}

final thirtyDayProvider = FutureProvider.autoDispose
    .family<Historical, String>((ref, countryName) async {
  final historical = ref.watch(historicalProvider);
  return historical.getHistoricalApi(country: countryName);
});

final historyItem = Provider.autoDispose
    .family<List<HistoryItem>, CountryAndType>((ref, countryAndType) {
  final historical = ref.watch(thirtyDayProvider(countryAndType.countryName));

  List<HistoryItem> _data(Historical data) {
    final Timeline items = data.timeline;

    List<HistoryItem> _loopHistoryItem(Map<String, int> x) {
      final List<HistoryItem> output = [];
      x.forEach((key, value) {
        final item = {'date': key, 'count': value};
        output.add(HistoryItem.fromJson(item));
      });
      return output;
    }

    switch (countryAndType.historyItemType) {
      case HistoryItemType.cases:
        return _loopHistoryItem(items.cases);
        break;
      case HistoryItemType.recovered:
        return _loopHistoryItem(items.recovered);
        break;
      case HistoryItemType.deaths:
        return _loopHistoryItem(items.deaths);
        break;
      default:
        return _loopHistoryItem(items.cases);
    }
  }

  return historical.when(
    data: (data) => _data(data),
    loading: () => [],
    error: (error, _) => [],
  );
});
