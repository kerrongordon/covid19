import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/providers/travel-alert-provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final travelAlert = FutureProvider.autoDispose
    .family<TravelAlert, String>((ref, countrycode) async {
  final travel = ref.watch(travelAlertProvider);
  return travel.gettravelAlertApi(countrycode: countrycode);
});
