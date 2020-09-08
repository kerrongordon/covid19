import 'package:covid19/models/vaccine-model.dart';
import 'package:covid19/utils/failure.util.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class VaccineService {
  static const url = 'https://disease.sh/v3/covid-19/vaccine';

  Future<List<Datum>> getVaccineApi() async {
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

      List<Datum> vaccines = [];
      Vaccine data = Vaccine.fromJson(res.data);

      for (var vaccine in data.data) {
        // Datum list = Datum.fromJson(vaccine);
        vaccines.add(vaccine);
      }

      return vaccines;

      // Vaccine data = Vaccine.fromJson(res.data);

      // return data.data;
    } on DioError {
      throw Failure('Oh no something went wrong 😥️');
    } catch (e) {
      throw Failure('There seem to be a problem 😱️');
    }
  }
}
