import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get timeOnly {
    final DateFormat formatter = DateFormat.Hms();
    return formatter.format(this);
  }
}
