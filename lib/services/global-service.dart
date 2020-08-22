import 'package:covid19/models/global-model.dart';
import 'package:dio/dio.dart';

class GlobalService {
  static const url = 'https://corona.lmao.ninja/v2/all';

  Future<Global> getGlobalApi() async {
    Dio dio = new Dio();

    try {
      Response res = await dio.get(url);
      Global data = Global.fromJson(res.data);
      print('GlobalServiceData $data');
      return data;
    } catch (e) {
      print('GlobalServiceERROR $e');
      throw e;
    }
  }
}
