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

  /// Decimal forcing regex.
  static RegExp decimalForce(int decimalPoints) {
    if (decimalPoints == 0) return RegExp(r'^\d+');
    final String dec = decimalPoints.toString();
    const String pre = r'^\d+\.?\d{';
    // ignore: prefer_interpolation_to_compose_strings
    return RegExp(pre + '0,$dec}');
  }

  /// Only number regex.
  static final RegExp numerical = RegExp(r'(^\d*\.?\d*)');

  /// Zero lead integer regex.
  static final RegExp zeroLeadInt = RegExp('^0[^.]');
}
