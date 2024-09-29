import 'package:flutter/foundation.dart';

/// The custom durations.
@immutable
abstract final class CustomDurations {
  /// The very fast duration: 100 milliseconds.
  static const Duration veryFastDuration = Duration(milliseconds: 100);

  /// The fast duration: 150 milliseconds.
  static const Duration fastDuration = Duration(milliseconds: 150);

  /// The default duration: 300 milliseconds.
  static const Duration defaultDuration = Duration(milliseconds: 300);

  /// The mid duration: 450 milliseconds.
  static const Duration midDuration = Duration(milliseconds: 450);

  /// The slow duration: 600 milliseconds.
  static const Duration slowDuration = Duration(milliseconds: 600);

  /// The very slow duration: 1000 milliseconds.
  static const Duration verySlowDuration = Duration(milliseconds: 1000);

  /// The signed in duration: 2 hours.
  static const Duration signedInDuration = Duration(hours: 2);
}
