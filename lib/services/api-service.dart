import 'package:covid19/models/countries-all.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const countriesUrl = 'https://api.covid19api.com/summary';

  Dio _dio = Dio();

  Future<Countries> getGlobal() async {
    try {
      Response res = await _dio.get(countriesUrl);
      Countries data = Countries.fromJson(res.data);
      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Country>> getAllCountries() async {
    try {
      Response res = await _dio.get(countriesUrl);
      Countries data = Countries.fromJson(res.data);
      return data.countries;
    } catch (e) {
      throw e;
    }
  }
}
