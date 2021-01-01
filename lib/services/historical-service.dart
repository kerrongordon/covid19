import 'package:covid19/configs/api.config.dart';
import 'package:covid19/models/historical-model.dart';
import 'package:covid19/utils/api.util.dart';

class HistoricalService {
  Future<Historical> getHistoricalApi({String country}) async {
    ApiUtil _historicalService = new ApiUtil();

    dynamic data = await _historicalService.getData(
      baseUrl: baseUrl,
      endPoint: '/covid-19/historical/$country',
      queryParameters: {'lastdays': '30'},
    );

    return Historical.fromJson(data);
  }
}
