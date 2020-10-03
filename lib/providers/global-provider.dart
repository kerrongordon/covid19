import 'package:covid19/models/global-model.dart';
import 'package:covid19/services/global-service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final globalProvider = FutureProvider.autoDispose((_) async {
  final res = await GlobalService().getGlobalApi();
  return Global.fromJson(res.data);
});
