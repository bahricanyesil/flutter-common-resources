import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';

import 'default_theme_helper.dart';

/// Customized dartk theme.
@immutable
class DefaultDarkTheme implements BaseTheme {
  /// Creates a [DefaultDarkTheme] optionally with the given [seedColor]
  /// if provided.
  const DefaultDarkTheme({this.seedColor});

  /// SeedColor color of the [DefaultDarkTheme].
  final Color? seedColor;

  @override
  ThemeData get themeData =>
      DefaultThemeHelper.defaultThemeData(primaryColor: seedColor);

  @override
  ColorScheme get colorScheme => seedColor != null
      ? ColorScheme.fromSeed(seedColor: seedColor!)
      : const ColorScheme.dark();

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}
