/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'dart:developer';

import 'package:logger/logger.dart';
import '../extensions/date_time_extension.dart';

class AppLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    log(
      '${event.origin.time.timeOnly}${PrettyPrinter.defaultLevelEmojis[event.level]}${event.origin.message}',
    );
  }
}
