import 'package:flutter/material.dart';

/// Extension on [ThemeData] to get the primary and secondary colors.
extension ThemeDataExtensions on ThemeData {
  /// The color scheme of the theme.
  Color get primary => colorScheme.primary;

  /// The secondary color of the theme.
  Color get secondary => colorScheme.secondary;
}
