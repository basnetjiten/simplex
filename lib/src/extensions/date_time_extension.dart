/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get timeOnly {
    final DateFormat formatter = DateFormat.Hms();
    return formatter.format(this);
  }
}
