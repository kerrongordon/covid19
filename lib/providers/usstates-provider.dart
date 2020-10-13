import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/services/usstates-service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final usStatesProvider = FutureProvider.autoDispose<List<UsStates>>(
    (_) => UsStatesService().getUsStatesApi());
