import 'package:covid19/models/global-model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class GlobalService {
  static const url = 'https://corona.lmao.ninja/v2/all';

  Future<Global> getGlobalApi() async {
    Dio dio = new Dio();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);

    try {
      Response res = await dio.get(
        url,
        options: buildCacheOptions(Duration(days: 1)),
      );
      Global data = Global.fromJson(res.data);

      return data;
    } catch (e) {
      throw e;
    }
  }
}
