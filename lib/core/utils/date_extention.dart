import 'package:clock/clock.dart';


extension DateTimeExt on DateTime {
  String toRelative() {
    final now = clock.now();
    final diff = now.difference(this);
    if (diff.inDays > 0) {
      return '${diff.inDays} day ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} hrs ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} mins ago';
    } else {
      return '${diff.inSeconds} seconds ago';
    }
  }}