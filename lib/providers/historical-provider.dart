import 'package:covid19/models/historical-model.dart';
import 'package:covid19/services/historical-service.dart';

class HistoricalProvider {
  HistoricalService _historicalService = new HistoricalService();
  Historical _historical = new Historical();

  Future<Historical> getHistorical({String country}) async {
    _historical = await _historicalService.getHistoricalApi(country: country);
    return _historical;
  }
}
