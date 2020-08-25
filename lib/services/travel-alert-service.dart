import 'package:covid19/models/travel-alert-model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class TravelAlertService {
  static const url = 'http://api.coronatracker.com/v1/travel-alert';

  Future<List<TravelAlert>> gettravelAlertApi() async {
    Dio dio = new Dio();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);

    try {
      Response res = await dio.get(
        url,
        options: buildCacheOptions(
          Duration(hours: 12),
          maxStale: Duration(hours: 24),
        ),
      );

      List<TravelAlert> travelAlert = [];

      for (var travel in res.data) {
        TravelAlert list = TravelAlert.fromJson(travel);
        travelAlert.add(list);
      }

      return travelAlert;
    } catch (e) {
      throw e;
    }
  }
}
