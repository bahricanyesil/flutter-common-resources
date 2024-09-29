import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_resources/common_resources.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:log_manager/log_manager.dart';

/// Type definition for the app builder.
typedef AppBuilder = Widget Function({required AppInitResult result});

/// This class is responsible for initializing the application.
/// It ensures that the Flutter framework is initialized and sets up
/// error handling. The `initialize` method should be called to start
/// the initialization process. The `_initialize` method is used internally
/// to perform the actual initialization steps.
@immutable
abstract final class AppInit {
  const AppInit._();

  /// Initializes the application.
  /// This method should be called at the beginning of the application.
  static Future<void> initializeAndRun({
    required AppBuilder appBuilder,
    LogManager? logManager,
    AsyncCallback? firebaseInitializer,
    AnyCallback? dependencyInitializer,
    AnyCallback? localeInitializer,
    VoidCallback? mapperInitializer,
  }) async {
    Future<void> initAndRunApp() async {
      try {
        final WidgetsBinding binding =
            WidgetsFlutterBinding.ensureInitialized();

        /// Sets the splash screen.
        FlutterNativeSplash.preserve(widgetsBinding: binding);

        /// Sets the device orientation to portrait up and down on mobile.
        if (SafePlatformChecker.isMobile) await _setOrientation();

        /// Sets the system UI overlays.
        await _setSystemUIMode();

        /// Sets the error handlers.
        logManager?.setFlutterErrorHandlers(
          dispatcher: PlatformDispatcher.instance,
        );

        /// Sets the bloc observer to log bloc events.
        if (logManager != null) Bloc.observer = CustomBlocObserver(logManager);

        /// Initializes Firebase.
        await firebaseInitializer?.call();

        /// Initializes the dependencies.
        final AppInitResult result = await _initDependencies(
          logManager,
          dependencyInitializer,
          mapperInitializer,
        );

        await localeInitializer?.call();

        runApp(appBuilder(result: result));
      } catch (e, stackTrace) {
        _failedInitHandler(logManager, e, stackTrace, initAndRunApp);
      } finally {
        FlutterNativeSplash.remove();
      }
    }

    await initAndRunApp();
  }

  static Future<void> _setSystemUIMode() async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: <SystemUiOverlay>[SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }

  static Future<void> _setOrientation() async {
    await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }

  static Future<AppInitResult> _initDependencies(
    LogManager? logManager,
    AnyCallback? dependencyInitializer,
    VoidCallback? mapperInitializer,
  ) async {
    final DI di = DI(
      dependencyInitializer: dependencyInitializer,
      mapperInitializer: mapperInitializer,
    );
    final AppInitResult result = await di.setUp();
    return result;
  }

  static void _failedInitHandler(
    LogManager? logManager,
    Object e,
    StackTrace stackTrace,
    AsyncCallback initAndRunApp,
  ) {
    logManager?.lError(
      '❌ Initialization failed',
      error: e,
      stackTrace: stackTrace,
    );
    runApp(
      MaterialApp(
        home: FailedInitApp(
          error: e,
          stackTrace: stackTrace,
          retryInit: initAndRunApp,
        ),
      ),
    );
  }
}
