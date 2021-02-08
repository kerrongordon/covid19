import 'package:covid19/translations/app-translate.dart';
import 'package:covid19/utils/failure.util.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio_retry/dio_retry.dart';

class ApiUtil {
  final Dio _dio = Dio();

  Future<dynamic> getData({
    String baseUrl,
    String endPoint,
    Map<String, dynamic> queryParameters,
  }) async {
    final String url = baseUrl + endPoint;
    _dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: url)).interceptor as Interceptor);
    _dio.interceptors.add(RetryInterceptor(dio: _dio));

    try {
      final Response res = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: buildCacheOptions(
          const Duration(minutes: 10),
          maxStale: const Duration(minutes: 15),
          options: Options(
            extra: const RetryOptions(
              retryInterval: Duration(seconds: 10),
            ).toExtra(),
          ),
        ),
      );

      return res.data;
    } on DioError {
      throw Failure('$messageone 😥️');
    } catch (e) {
      throw Failure('$messagetwo 😱️');
    }
  }
}
