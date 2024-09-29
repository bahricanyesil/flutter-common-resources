import 'package:flutter/foundation.dart';

/// Custom exception thrown when a dependency is not registered.
@immutable
final class UnregisteredDependencyException implements Exception {
  /// Constructor for UnregisteredDependencyException.
  const UnregisteredDependencyException({
    required this.dependencyType,
    this.instanceName,
  });

  /// The type of the dependency that is not registered.
  final Type dependencyType;

  /// The name of the instance of the dependency that is not registered.
  final String? instanceName;

  @override
  String toString() {
    final String instanceNameStr =
        instanceName != null ? ' with name $instanceName' : '';
    return '''UnRegisteredDependencyException: No registered dependency of type $dependencyType$instanceNameStr.''';
  }
}
