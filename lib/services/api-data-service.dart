import 'dart:convert';

import 'package:covid19/models/summary-model.dart';
import 'package:http/http.dart';

class ApiDataService {
  final String api = 'https://api.covid19api.com/';

  Future<SummaryModel> getSummary() async {
    Response res = await get('${api}summary');

    if (res.statusCode == 200) {
      SummaryModel body = SummaryModel.fromJson(jsonDecode(res.body));
      return body;
    } else {
      throw 'Can\'t load Data';
    }
  }
}
