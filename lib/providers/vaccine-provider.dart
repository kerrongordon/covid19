import 'package:covid19/models/vaccine-model.dart';
import 'package:covid19/services/vaccine-service.dart';

class VaccineProvider {
  VaccineService _vaccineService = new VaccineService();
  List<Datum> _vaccine = new List<Datum>();

  Future<List<Datum>> getVaccine() async {
    _vaccine = await _vaccineService.getVaccineApi();
    return _vaccine;
  }
}
