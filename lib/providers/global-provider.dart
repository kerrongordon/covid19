import 'package:covid19/services/global-service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final globalProvider = FutureProvider.autoDispose((_) async {
  final GlobalService _globalService = GlobalService();
  return _globalService.getGlobalApi();
});
