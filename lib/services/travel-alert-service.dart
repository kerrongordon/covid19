import 'dart:io';

import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/utils/failure.util.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class TravelAlertService {
  static const url = 'https://www.travel-advisory.info/api';

  Future<TravelAlert> gettravelAlertApi({String countrycode}) async {
    Dio dio = new Dio();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);

    try {
      Response res = await dio.get(
        url,
        queryParameters: {'countrycode': countrycode},
        options: buildCacheOptions(
          Duration(hours: 1),
          maxStale: Duration(hours: 2),
        ),
      );

      TravelAlert data = TravelAlert.fromJson(res.data);

      return data;
    } on DioError {
      throw Failure('Oh no something went wrong 😥️');
    } catch (e) {
      throw Failure('There seem to be a problem 😱️');
    }
  }
}
