import 'package:covid19/configs/api.config.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/utils/api.util.dart';

class OneCountryService {
  Future<Country> getOneCountryApi({String country}) async {
    final ApiUtil _oneCountryService = ApiUtil();

    final dynamic data = await _oneCountryService.getData(
      baseUrl: baseUrl,
      endPoint: '/covid-19/countries/$country',
      queryParameters: {'yesterday': 'true', 'strict': 'true'},
    );

    return Country.fromJson(data as Map<String, dynamic>);
  }
}
