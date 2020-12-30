import 'package:geolocator/geolocator.dart';

class PositionUtil {
  static Future<Position> use() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
