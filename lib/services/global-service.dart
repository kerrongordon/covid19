import 'package:dio/dio.dart';
import 'package:covid19/utils/failure.util.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class GlobalService {
  static const url = 'https://disease.sh/v3/covid-19/all';

  Future<Response<dynamic>> getGlobalApi() async {
    Dio dio = new Dio();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);

    try {
      Response res = await dio.get(
        url,
        options: buildCacheOptions(
          Duration(hours: 1),
          maxStale: Duration(hours: 2),
        ),
      );

      return res;
    } on DioError {
      throw Failure('Oh no something went wrong 😥️');
    } catch (e) {
      throw Failure('There seem to be a problem 😱️');
    }
  }
}
