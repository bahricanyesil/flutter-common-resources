import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';

import 'default_theme_helper.dart';

/// Customized light theme.
@immutable
class DefaultLightTheme implements BaseTheme {
  /// Creates a [DefaultLightTheme] optionally with the given [seedColor]
  /// if provided.
  const DefaultLightTheme({this.seedColor});

  /// SeedColor color of the [DefaultLightTheme].
  final Color? seedColor;

  @override
  ThemeData get themeData => DefaultThemeHelper.defaultThemeData(
        primaryColor: seedColor,
        isDark: false,
      ).copyWith(
        textTheme: DefaultThemeHelper.defaultTextTheme(isDark: false),
      );

  @override
  ColorScheme get colorScheme => seedColor != null
      ? ColorScheme.fromSeed(seedColor: seedColor!)
      : const ColorScheme.light();

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}
