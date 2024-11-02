import 'package:flutter/foundation.dart';

/// Custom exception thrown when a dependency is not registered.
@immutable
final class UnregisteredDIException implements Exception {
  /// Constructor for UnregisteredDIException.
  const UnregisteredDIException({
    required this.dependencyType,
    required this.stackTrace,
    this.instanceName,
  });

  /// The type of the dependency that is not registered.
  final Type dependencyType;

  /// The name of the instance of the dependency that is not registered.
  final String? instanceName;

  /// The stack trace of the exception.
  final StackTrace? stackTrace;

  @override
  String toString() {
    final String instanceNameStr =
        instanceName != null ? ' with name $instanceName' : '';
    return '''Unregistered: No registered dependency of type $dependencyType$instanceNameStr.''';
  }
}
