import 'package:covid19/models/country-model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class OneCountryService {
  Future<Country> getOneCountryApi({String country}) async {
    String url = 'https://disease.sh/v3/covid-19/countries/$country';
    Dio dio = new Dio();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);

    try {
      Response res = await dio.get(
        url,
        queryParameters: {'yesterday': 'true', 'strict': 'true'},
        options: buildCacheOptions(
          Duration(hours: 1),
          maxStale: Duration(hours: 2),
        ),
      );

      Country data = Country.fromJson(res.data);

      return data;
    } catch (e) {
      throw e;
    }
  }
}
