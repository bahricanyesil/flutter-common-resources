import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Extension on [DateTime] class to provide additional functionality.
extension DateTimeExtensions on DateTime {
  /// Returns a formatted string representation of the date and time
  /// in the format 'yyyy-MM-dd – HH:mm:ss'.
  /// Example: "2022-01-01 – 12:34:56"
  String get fullDate => DateFormat('yyyy-MM-dd – HH:mm:ss').format(this);

  /// Returns the formatted time string in "HH:mm:ss" format.
  /// Example: "12:34:56"
  String get hms => DateFormat.Hms().format(this);

  /// Returns the formatted time string in "HH:mm" format.
  /// Example: "12:34"
  String get hm => DateFormat.Hm().format(this);

  /// Returns a formatted string representation of the date in the format
  /// "year-month-day".
  ///
  /// Example:
  ///
  /// ```dart
  /// DateTime date = DateTime.now();
  /// String formattedDate = date.yMd;
  /// ```
  String get yMd => DateFormat.yMd().format(this);

  /// Returns a formatted string representation of the date
  /// in the format "yMMMd".
  ///
  /// The format "yMMMd" represents the year, month, and day of the date.
  ///
  /// Example:
  ///
  /// ```dart
  /// DateTime date = DateTime.now();
  /// String formattedDate = date.yMMMd; // e.g. "Jan 1, 2022"
  /// ```
  String get yMMMd => DateFormat.yMMMd().format(this);

  /// Returns a formatted string representation of the date and time using the
  /// pattern "yMMMMd".
  /// The pattern includes the full year, the full month name, and the day of
  /// the month.
  /// Example: "January 1, 2022"
  String get yMMMMd => DateFormat.yMMMMd().format(this);

  /// Returns a formatted string representation of the date and time using the
  /// pattern "MMMMEEEEd".
  ///
  /// The pattern includes the full month name, the full day of the week, and
  /// the day of the month.
  String get dayNameDM => DateFormat.MMMMEEEEd().format(this);

  /// Returns a formatted string to indicate the time since the start time.
  String sinceDate(DateTime startTime) {
    final String h = _twoDigits(hour);
    final String min = _twoDigits(minute);
    final String sec = _twoDigits(second);
    final String ms = _threeDigits(millisecond);
    final String timeSinceStart = difference(startTime).toString();
    return '$h:$min:$sec.$ms (+$timeSinceStart)';
  }

  String _threeDigits(int n) {
    if (n >= 100) return '$n';
    if (n >= 10) return '0$n';
    return '00$n';
  }

  String _twoDigits(int n) => n >= 10 ? '$n' : '0$n';

  /// Returns a boolean value indicating whether the date is before the
  bool isBeforeUtc(DateTime other) => toUtc().isBefore(other.toUtc());

  /// Returns a boolean value indicating whether the date is today.
  bool get isToday => isAddedDate(0);

  /// Returns a boolean value indicating whether the date is tomorrow.
  bool get isTomorrow => isAddedDate(1);

  /// Compares the date with the date after adding the given number of days.
  bool isAddedDate(int days) {
    final DateTime addedDate = DateTime.now().add(Duration(days: days));
    return day == addedDate.day &&
        month == addedDate.month &&
        year == addedDate.year;
  }
}

/// Extension on [DateTimeRange] class to provide additional functionality.
extension CustomDateTimeRangeExt on DateTimeRange {
  /// Returns a formatted string representation of the date range.
  String get formattedDateTimeRange {
    final String startText = start.yMd;
    final String endText = end.yMd;
    return '$startText–$endText';
  }
}
