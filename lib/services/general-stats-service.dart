import 'dart:convert';

import 'package:covid19/models/general-stats.dart';
import 'package:http/http.dart';

class GeneralStatsService {
  final String url =
      'https://corona-virus-stats.herokuapp.com/api/v1/cases/general-stats';

  Future<GeneralStats> getGeneralStats() async {
    Response res = await get(url);

    if (res.statusCode == 200) {
      GeneralStats body = GeneralStats.fromJson(jsonDecode(res.body));
      return body;
    } else {
      throw 'Can\'t get Data';
    }
  }
}
