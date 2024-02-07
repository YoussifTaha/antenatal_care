import 'package:intl/intl.dart';

abstract class EasyDateFormatter {
  /// Returns the short name of the day of the given date in the specified locale.
  static String shortDayName(DateTime date, String locale) {
    return DateFormat("E", locale).format(date);
  }

  /// Returns the full name of the day of the given date in the specified locale.
  static String fullDayName(DateTime date, String locale) {
    return DateFormat("EEEE", locale).format(date);
  }

  /// Returns the short name of the month of the given date in the specified locale.
  static String shortMonthName(DateTime date, String locale) {
    return DateFormat("MMM", locale).format(date);
  }

  /// Returns a custom formatted string representing the given date in the specified locale.
  static String customFormat(String format, DateTime date, String locale) {
    return DateFormat(format, locale).format(date);
  }

  /// Returns the full name of the month of the given date in the specified locale.
  static String fullMonthName(DateTime date, String locale) {
    return DateFormat("MMMM", locale).format(date);
  }

  /// Returns the full date of the given date in the "dd/MM/yyyy" format and the specified locale.
  static String fullDateDMY(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }
}
