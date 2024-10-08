import 'package:intl/intl.dart';

class DateParser{
  String formatDate(DateTime dateTime) {
  return DateFormat.yMMMd().format(dateTime);
}
}