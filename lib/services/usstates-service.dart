import 'package:covid19/configs/api.config.dart';
import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/utils/api.util.dart';

class UsStatesService {
  Future<List<UsStates>> getUsStatesApi() async {
    final ApiUtil _usStatesService = ApiUtil();

    final dynamic data = await _usStatesService.getData(
      baseUrl: baseUrl,
      endPoint: '/covid-19/states',
      queryParameters: {'sort': 'cases', 'yesterday': 'true'},
    );

    final List<UsStates> state = [];

    for (final item in data) {
      final UsStates list = UsStates.fromJson(item as Map<String, dynamic>);
      state.add(list);
    }

    return state;
  }
}
