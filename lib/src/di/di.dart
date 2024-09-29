import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../constants/custom_type_definitions.dart';
import '../exceptions/unregistered_di_exception.dart';
import 'app_init_result.dart';

export 'app_init_result.dart';

/// A class that initializes the dependencies for the application.
@immutable
final class DI {
  /// Initializes the dependencies for the application.
  const DI({
    this.dependencyInitializer,
    this.mapperInitializer,
  });

  /// The callback to initialize the dependencies.
  final AnyCallback? dependencyInitializer;

  /// The callback to initialize the mappers.
  final VoidCallback? mapperInitializer;

  static final GetIt _getIt = GetIt.I;

  /// Sets up the dependencies for the application.
  Future<AppInitResult> setUp() async {
    log('Setting up dependencies...');
    final Stopwatch stopwatch = Stopwatch()..start();
    await dependencyInitializer?.call();
    mapperInitializer?.call();
    log('Dependencies set up in ${stopwatch.elapsedMilliseconds}ms');
    stopwatch.stop();
    final AppInitResult result =
        AppInitResult(msSpent: stopwatch.elapsedMilliseconds);
    return result;
  }

  /// Retrieves a dependency instance of type [T].
  ///
  /// Returns the registered instance of type [T] from the dependency injector.
  static T getI<T extends Object>({String? instanceName, Type? type}) {
    if (_getIt.isRegistered<T>(instanceName: instanceName, instance: type)) {
      return _getIt<T>(instanceName: instanceName);
    }
    throw UnregisteredDIException(
      dependencyType: T,
      instanceName: instanceName,
      stackTrace: StackTrace.current,
    );
  }

  /// Retrieves a dependency instance of type [T] if it is registered safely.
  static T? safeGetI<T extends Object>({String? instanceName, Type? type}) {
    if (_getIt.isRegistered<T>(instanceName: instanceName)) {
      return _getIt<T>(instanceName: instanceName, type: type);
    }
    return null;
  }

  /// Registers a singleton instance of type [T].
  static void registerI<T extends Object>(
    T instance, {
    String? instanceName,
    DisposingFunc<T>? disposeFunc,
  }) {
    _getIt.registerSingleton<T>(
      instance,
      instanceName: instanceName,
      dispose: disposeFunc,
    );
  }

  /// Registers a singleton instance of type [T] lazily.
  static void registerLazyI<T extends Object>(
    FactoryFunc<T> instanceFactory, {
    String? instanceName,
    DisposingFunc<T>? disposeFunc,
  }) {
    _getIt.registerLazySingleton<T>(
      instanceFactory,
      instanceName: instanceName,
      dispose: disposeFunc,
    );
  }
}
