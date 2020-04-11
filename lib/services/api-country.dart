import 'dart:convert';

import 'package:covid19/models/country-statistics.dart';
import 'package:http/http.dart';

class ApiCountry {
  static const countryUrl = 'https://corona.lmao.ninja/countries?sort=country';

  Future<List<CountryStatistics>> getCountryStatistics() async {
    Response res =
        await get(countryUrl, headers: {"Content-type": "application/json"});
    if (res.statusCode == 200) {
      List parsed = jsonDecode(res.body);

      return parsed.map((json) => CountryStatistics.fromJson(json)).toList();
    } else {
      throw 'network error';
    }
  }
}
