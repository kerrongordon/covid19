import 'package:covid19/models/global-model.dart';
import 'package:covid19/services/global-service.dart';

class GlobalProvider {
  GlobalService _globalService = new GlobalService();
  Global _global = new Global();

  Future<Global> getGlobal() async {
    _global = await _globalService.getGlobalApi();
    return _global;
  }
}
