import 'package:covid19/utils/position.util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationProvider = FutureProvider.autoDispose(
  (_) async => PositionUtil.use(),
);
