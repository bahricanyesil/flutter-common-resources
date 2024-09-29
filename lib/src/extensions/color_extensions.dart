import 'package:flutter/material.dart';

/// Extensions for [Color] class
extension ColorExtensions on Color {
  /// Returns the hex value of the color.
  String get hexValue {
    final String value = toString();
    final int firstIndex = value.indexOf('(');
    final int lastIndex = value.lastIndexOf(')');
    return value.substring(firstIndex + 1, lastIndex);
  }

  /// Makes color more darker.
  Color darken([double amount = .2]) {
    assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslDark =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Makes color more lighter.
  Color lighten([double amount = .2]) {
    assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}

/// An extension on [String] that provides a convenient way to convert
/// a string representation of a color to a [Color] object.
///
/// This extension adds a getter named `toColor` to [String] that returns
/// a [Color] object representing the color value of the string.
/// The string should be in the format of a color code, either in hexadecimal
/// format with or without the '#' prefix.
/// If the string is null or cannot be parsed as a valid color code,
/// the getter returns null.
///
/// Example usage:
/// ```dart
/// String colorCode = '#FF0000';
/// Color? color = colorCode.toColor;
/// ```
extension StringColorExtensions on String? {
  /// Converts the string to a color.
  Color? get toColor {
    if (this == null) return null;
    final int? val = int.tryParse(this!.replaceFirst('#', '0xff'));
    return val == null ? null : Color(val);
  }
}
