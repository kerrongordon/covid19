import 'package:intl/intl.dart';

class TimeToDate {
  static String use(int num) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(num);
    String formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }
}
