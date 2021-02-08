import 'package:covid19/configs/api.config.dart';
import 'package:covid19/utils/api.util.dart';
import 'package:covid19/models/country-model.dart';

class CountryService {
  Future<List<Country>> getCountryApi() async {
    final ApiUtil _countryService = ApiUtil();

    final dynamic data = await _countryService.getData(
      baseUrl: baseUrl,
      endPoint: '/covid-19/countries',
      queryParameters: {'yesterday': 'true', 'sort': 'cases'},
    );

    final List<Country> counties = [];

    for (final country in data) {
      final Country list = Country.fromJson(country as Map<String, dynamic>);
      counties.add(list);
    }

    return counties;
  }
}
