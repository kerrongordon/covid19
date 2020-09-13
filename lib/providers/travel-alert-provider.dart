import 'package:covid19/services/travel-alert-service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final travelAlertProvider = Provider.autoDispose((_) => TravelAlertService());
