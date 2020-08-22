import 'dart:io';

import 'package:covid19/models/countries-all.dart';
import 'package:covid19/utils/failure.util.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const countriesUrl = 'https://api.covid19api.com/summary';

  // Dio _dio = Dio();

  Future<Countries> loadData() async {
    Dio dio = new Dio();

    try {
      Response res = await dio.get(countriesUrl);
      Countries data = Countries.fromJson(res.data);

      return data;
    } on SocketException {
      throw Failure('No Internet Connection!');
    } on HttpException {
      throw Failure('Could Not Find Any Data');
    }
  }

  // Future<Countries> getData() async {
  //   Dio dio = new Dio();
  //   try {
  //     Response res = await dio.get(countriesUrl);
  //     Countries data = Countries.fromJson(res.data);
  //     return data;
  //   } on DioError catch (e) {
  //     switch (e.type) {
  //       case DioErrorType.CONNECT_TIMEOUT:
  //         throw Exception(e.message);
  //         break;
  //       case DioErrorType.SEND_TIMEOUT:
  //         throw Exception(e.message);
  //         break;
  //       case DioErrorType.RECEIVE_TIMEOUT:
  //         throw Exception(e.message);
  //         break;
  //       case DioErrorType.RESPONSE:
  //         throw Exception(e.message);
  //         break;
  //       case DioErrorType.CANCEL:
  //         throw Exception(e.message);
  //         break;
  //       case DioErrorType.DEFAULT:
  //         throw Exception(e.message);
  //         break;
  //       default:
  //         throw Exception(e.message);
  //     }
  //   }
  // }

  // Future<Countries> getGlobal() async {
  //   try {
  //     Response res = await _dio.get(countriesUrl);
  //     Countries data = Countries.fromJson(res.data);
  //     return data;
  //   } on DioError catch (e) {
  //     print('test1');
  //     print(e.message);
  //     print('test2');
  //     // throw e;
  //     rethrow;
  //   }
  // }

  // Future<List<Country>> getAllCountries() async {
  //   try {
  //     Response res = await _dio.get(countriesUrl);
  //     Countries data = Countries.fromJson(res.data);
  //     return data.countries;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
