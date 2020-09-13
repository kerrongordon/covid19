import 'package:covid19/services/one-country-service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final oneCountryProvider = Provider.autoDispose((_) => OneCountryService());
