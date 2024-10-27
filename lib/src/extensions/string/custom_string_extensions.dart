/// Custom extensions on [String] class.
extension CustomStringExtensions on String? {
  /// Returns `true` if this [String] contains the [other] [String] ignoring
  /// case, otherwise returns `false`.
  bool containsIgnoreCase(String other) =>
      this?.toLowerCase().contains(other.toLowerCase()) ?? false;

  /// Returns `true` if this [String] equals the [other] [String] ignoring
  bool equalsIgnoreCase(String other) =>
      this?.toLowerCase() == other.toLowerCase();

  /// Returns true if the string is null or empty, otherwise false.
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
