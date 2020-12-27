import 'package:covid19/utils/failure.util.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiUtil {
  Dio _dio = new Dio();

  Future<dynamic> getData({
    String baseUrl,
    String endPoint,
    Map<String, dynamic> queryParameters,
  }) async {
    final String url = baseUrl + endPoint;
    _dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);

    try {
      Response res = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: buildCacheOptions(
          Duration(hours: 1),
          maxStale: Duration(hours: 2),
        ),
      );

      return res.data;
    } on DioError {
      throw Failure('Oh no something went wrong 😥️');
    } catch (e) {
      throw Failure('There seem to be a problem 😱️');
    }
  }
}
