import 'package:flutter/foundation.dart';

/// Represents the result of an initialization process.
@immutable
class AppInitResult {
  /// Initializes an instance of [AppInitResult].
  const AppInitResult({required this.msSpent});

  /// The number of milliseconds spent during the initialization process.
  final int msSpent;

  @override
  String toString() => '$AppInitResult('
      'msSpent: $msSpent'
      ')';
}
