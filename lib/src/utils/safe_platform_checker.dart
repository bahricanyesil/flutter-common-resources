import 'package:flutter/foundation.dart';

/// A utility class for safely checking the current platform.
///
/// This class provides static methods to check if the current platform is
/// Android, iOS, macOS, Windows, Linux, Fuchsia, or Web. It uses the `Platform`
/// class from the `dart:io` library to determine the platform. The `kIsWeb`
/// constant is used to differentiate between web and non-web platforms.
abstract final class SafePlatformChecker {
  /// Returns `true` if the current platform is a web platform.
  static bool get isWeb => kIsWeb;

  /// Returns `true` if the current platform is Android and not a web platform.
  static bool get isAndroid =>
      !kIsWeb && TargetPlatform.android == defaultTargetPlatform;

  /// Returns `true` if the current platform is iOS and not a web platform.
  static bool get isIOS =>
      !kIsWeb && TargetPlatform.iOS == defaultTargetPlatform;

  /// Returns `true` if the current platform is macOS and not a web platform.
  static bool get isMacOS =>
      !kIsWeb && TargetPlatform.macOS == defaultTargetPlatform;

  /// Returns `true` if the current platform is Windows and not a web platform.
  static bool get isWindows =>
      !kIsWeb && TargetPlatform.windows == defaultTargetPlatform;

  /// Returns `true` if the current platform is Linux and not a web platform.
  static bool get isLinux =>
      !kIsWeb && TargetPlatform.linux == defaultTargetPlatform;

  /// Returns `true` if the current platform is Fuchsia and not a web platform.
  static bool get isFuchsia =>
      !kIsWeb && TargetPlatform.fuchsia == defaultTargetPlatform;

  /// Returns `true` if the current platform is a desktop platform.
  static bool get isDesktop => isMacOS || isWindows || isLinux;

  /// Returns `true` if the current platform is a mobile platform.
  static bool get isMobile => isAndroid || isIOS;

  /// Returns the name of the current platform.
  static String get platformName => isWeb ? 'web' : defaultTargetPlatform.name;

  /// Returns `true` if the current platform is Apple.
  static bool get isApple => isIOS || isMacOS;
}
