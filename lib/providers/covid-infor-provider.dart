import 'dart:convert';

import 'package:covid19/models/covid-Infor.model.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final covidInforProvider = FutureProvider.autoDispose((_) async {
  final json = await rootBundle.loadString('json/covidInfor.json');
  final jsonResponse = await jsonDecode(json);
  return CovidInfor.fromJson(jsonResponse);
});
