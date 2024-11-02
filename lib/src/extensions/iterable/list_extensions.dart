/// A collection of extensions on [List] to provide additional functionality.
extension ListExtensions<T> on List<T> {
  /// Adds the [element] to the list if it is not already present.
  void addIfNotExists(T? element) {
    if (element != null && !contains(element)) add(element);
  }

  /// Returns a new list with distinct elements.
  List<T> distinct() => toSet().toList();
}
