/// A helper class for regular expressions used in the application.
abstract final class Regexes {
  const Regexes._();

  /// Regular expression pattern for parsing device stack traces.
  static final RegExp deviceStackTraceRegex =
      RegExp(r'#[0-9]+\s+(.+) \((\S+)\)');

  /// Regular expression pattern for parsing web stack traces.
  static final RegExp webStackTraceRegex =
      RegExp(r'^((packages|dart-sdk)/\S+/)');

  /// Regular expression pattern for parsing browser stack traces.
  static final RegExp browserStackTraceRegex =
      RegExp(r'^(?:package:)?(dart:\S+|\S+)');

  /// Regular expression pattern for parsing email addresses.
  static final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
}
