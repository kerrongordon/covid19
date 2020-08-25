import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/services/travel-alert-service.dart';

class TravelAlertProvider {
  TravelAlertService _travelAlertervice = new TravelAlertService();
  List<TravelAlert> _travelAlert = new List<TravelAlert>();

  Future<List<TravelAlert>> getTravelAlert() async {
    _travelAlert = await _travelAlertervice.gettravelAlertApi();
    return _travelAlert;
  }
}
