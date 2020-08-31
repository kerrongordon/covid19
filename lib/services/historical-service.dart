import 'package:covid19/models/historical-model.dart';
import 'package:covid19/utils/failure.util.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class HistoricalService {
  Future<Historical> getHistoricalApi({String country}) async {
    final String url = 'https://disease.sh/v3/covid-19/historical/$country';
    Dio dio = new Dio();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);

    try {
      Response res = await dio.get(
        url,
        queryParameters: {'lastdays': '30'},
        options: buildCacheOptions(
          Duration(hours: 1),
          maxStale: Duration(hours: 2),
        ),
      );
      Historical data = Historical.fromJson(res.data);

      return data;
    } on DioError {
      throw Failure('Oh no something went wrong 😥️');
    } catch (e) {
      throw Failure('There seem to be a problem 😱️');
    }
  }
}
