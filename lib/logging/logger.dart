import 'package:logger/logger.dart';
import 'package:simplex/logging/log_output.dart';

class SimplexAppLogger {
  static final Logger _logger = Logger(
    output: AppLogOutput(),
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  static void logAppError(dynamic error, StackTrace stackTrace) => _logger.log(
    Level.fatal,
    ':::APP_ERROR:: $error :::StackTrace:::$stackTrace',
  );

  static void logError({required dynamic error}) => _logger.e(error);

  static void logInfo({required dynamic info}) => _logger.i(info);

  static void logDebug({required dynamic info}) => _logger.d(info);

  static void logFatal({required dynamic info}) => _logger.f(info);
}
