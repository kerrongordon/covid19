import 'package:covid19/models/countries-all.dart';
import 'package:covid19/services/api-service.dart';

class ListProvider {
  ApiService _apiService = new ApiService();
  Countries _countries = new Countries();
  List<Country> _listCountries = new List<Country>();

  List<Country> get countries => _listCountries;

  Future<List<Country>> loadApi() async {
    _countries = await _apiService.loadData();
    return _countries.countries = _listCountries;
  }
}
