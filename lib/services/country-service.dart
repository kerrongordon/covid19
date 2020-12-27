import 'package:covid19/configs/api.config.dart';
import 'package:covid19/utils/api.util.dart';
import 'package:covid19/models/country-model.dart';

class CountryService {
  Future<List<Country>> getCountryApi() async {
    ApiUtil _countryService = new ApiUtil();

    dynamic data = await _countryService.getData(
      baseUrl: baseUrl,
      endPoint: '/covid-19/countries',
      queryParameters: {'yesterday': 'true', 'sort': 'cases'},
    );

    List<Country> counties = [];

    for (final country in data) {
      Country list = Country.fromJson(country);
      counties.add(list);
    }

    return counties;
  }
}
