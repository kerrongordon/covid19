import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/utils/failure.util.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class UsStatesService {
  Future<List<UsStates>> getUsStatesApi() async {
    final String url =
        'https://disease.sh/v3/covid-19/states?sort=cases&yesterday=false';
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

      List<UsStates> data = [];

      for (final item in res.data) {
        UsStates list = UsStates.fromJson(item);
        data.add(list);
      }

      return data;
    } on DioError {
      throw Failure('Oh no something went wrong 😥️');
    } catch (e) {
      print('=====================');
      print(e);
      print('=====================');
      throw Failure('There seem to be a problem 😱️');
    }
  }
}
