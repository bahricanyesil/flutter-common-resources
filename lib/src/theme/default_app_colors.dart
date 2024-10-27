import 'dart:ui';

/// The app colors.
abstract final class DefaultAppColors {
  /// The primary color.
  static const Color primary = Color(0xff6200ea);

  /// The primary variant color.
  static const Color primaryVariant = Color(0xff3700b3);

  /// The secondary color.
  static const Color secondary = Color(0xff03dac6);

  /// The secondary variant color.
  static const Color secondaryVariant = Color(0xff018786);

  /// The background color.
  static const Color background = Color(0xffffffff);

  /// The surface color.
  static const Color surface = Color(0xffffffff);

  /// The error color.
  static const Color error = Color(0xffb00020);

  /// The on primary color.
  static const Color onPrimary = Color(0xffffffff);

  /// The on secondary color.
  static const Color onSecondary = Color(0xff000000);

  /// The on background color.
  static const Color onBackground = Color(0xff000000);

  /// The on surface color.
  static const Color onSurface = Color(0xff000000);

  /// The on error color.
  static const Color onError = Color(0xffffffff);

  /// The selected color.
  static const Color selectedColor = Color(0xffefefef);

  /// The inactive color.
  static const Color inactive = Color.fromARGB(255, 122, 122, 122);

  /// The black text color.
  static const Color blackText = Color(0xff111111);

  /// The white text color.
  static const Color whiteText = Color(0xffffffff);

  /// The success color.
  static const Color success = Color(0xff4caf50);

  /// The warning color.
  static const Color warning = Color(0xffffc107);

  /// The info color.
  static const Color info = Color(0xff2196f3);

  /// The light grey color.
  static const Color lightGrey = Color(0xffd3d3d3);

  /// The dark grey color.
  static const Color darkGrey = Color(0xffa9a9a9);

  /// Scaffold background color for dark theme.
  static const Color darkScaffold = Color(0xFF121212);

  /// Scaffold background color for light theme.
  static const Color lightScaffold = Color(0xFFFFFFFF);

  /// App bar background color for dark theme.
  static const Color darkAppBar = Color(0xFF1F1F1F);

  /// App bar background color for light theme.
  static const Color lightAppBar = Color(0xFFFFFFFF);
}
