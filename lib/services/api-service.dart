import 'package:covid19/models/global-statistics.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const baseUrl = 'https://api.thevirustracker.com/free-api';

  Dio _dio = Dio();

  Future<GlobalStatistics> getGlobalStatistics() async {
    try {
      Response res =
          await _dio.get(baseUrl, queryParameters: {"global": "stats"});
      GlobalStatistics data = GlobalStatistics.fromJson(res.data);
      return data;
    } catch (e) {
      throw e;
    }
  }
}
