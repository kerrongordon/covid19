import 'package:covid19/services/historical-service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historicalProvider = Provider.autoDispose((_) => HistoricalService());
