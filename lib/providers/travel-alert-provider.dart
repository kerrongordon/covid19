import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/services/travel-alert-service.dart';

class TravelAlertProvider {
  TravelAlertService _travelAlertervice = new TravelAlertService();
  TravelAlert _travelAlert = new TravelAlert();

  Future<TravelAlert> getTravelAlert({String countrycode}) async {
    _travelAlert =
        await _travelAlertervice.gettravelAlertApi(countrycode: countrycode);
    return _travelAlert;
  }
}
