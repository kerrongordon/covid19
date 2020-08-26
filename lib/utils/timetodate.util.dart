import 'package:intl/intl.dart';

class TimeToDate {
  static String use(int num) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(num);
    String formattedDate = DateFormat.yMMMMEEEEd().format(date);
    return formattedDate;
  }
}
