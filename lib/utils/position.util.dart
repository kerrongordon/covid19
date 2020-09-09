import 'package:geolocator/geolocator.dart';

class PositionUtil {
  static Future<Position> use() async {
    await requestPermission();
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
