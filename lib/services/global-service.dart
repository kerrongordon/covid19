import 'package:covid19/configs/api.config.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/utils/api.util.dart';

class GlobalService {
  Future<Global> getGlobalApi() async {
    ApiUtil _globalService = ApiUtil();

    dynamic data = await _globalService.getData(
      baseUrl: baseUrl,
      endPoint: '/covid-19/all',
    );

    return Global.fromJson(data);
  }
}
