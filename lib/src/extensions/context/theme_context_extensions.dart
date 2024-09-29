import 'package:flutter/material.dart';

/// Theme extension for easy use with context.
extension ThemeContextExtensions on BuildContext {
  /// Current theme of the app.
  ThemeData get themeD => Theme.of(this);

  /// Text theme of the app.
  TextTheme get textTheme => themeD.textTheme;

  /// Small label text style.
  TextStyle? get labelSmall => textTheme.labelSmall;

  /// Medium label text style.
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// Large label text style.
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// Small body text style.
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// Medium body text style.
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// Large body text style.
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// Small title text style.
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// Medium title text style.
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// Medium-Large title text style.
  TextStyle? get titleMediumLarge {
    final double med = titleMedium?.fontSize ?? 1;
    final double large = titleLarge?.fontSize ?? 1;
    return textTheme.titleMedium?.copyWith(fontSize: (med + large) / 2);
  }

  /// Large title text style.
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// Small display text style.
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// Medium display text style.
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// Large display text style.
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// Small headline text style.
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// Medium headline text style.
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// Large headline text style.
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// Error color of the app.
  Color? get errorColor => themeD.colorScheme.error;
}
