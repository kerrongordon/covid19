import 'package:intl/intl.dart';

class TimeToDate {
  static String use(int num) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(num);
    final String formattedDate = DateFormat.yMMMMEEEEd().format(date);
    return formattedDate;
  }
}
