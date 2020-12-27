import 'package:covid19/configs/api.config.dart';
import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/utils/api.util.dart';

class UsStatesService {
  Future<List<UsStates>> getUsStatesApi() async {
    ApiUtil _usStatesService = new ApiUtil();

    dynamic data = await _usStatesService.getData(
      baseUrl: baseUrl,
      endPoint: '/covid-19/states',
      queryParameters: {'sort': 'cases', 'yesterday': 'true'},
    );

    List<UsStates> state = [];

    for (final item in data) {
      UsStates list = UsStates.fromJson(item);
      state.add(list);
    }

    return state;
  }
}
