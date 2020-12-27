import 'package:covid19/configs/api.config.dart';
import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/utils/api.util.dart';

class TravelAlertService {
  Future<TravelAlert> gettravelAlertApi({String countrycode}) async {
    ApiUtil _travelAlertService = new ApiUtil();

    dynamic data = await _travelAlertService.getData(
      baseUrl: travelUrl,
      endPoint: '/api',
      queryParameters: {'countrycode': countrycode},
    );

    return TravelAlert.fromJson(data);
  }
}
