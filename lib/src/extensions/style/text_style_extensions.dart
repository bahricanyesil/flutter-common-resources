import 'package:flutter/material.dart';

/// Collection of extension methods for [TextStyle].
extension TextStyleExtensions on TextStyle? {
  /// Copy the [TextStyle] with the given [color]
  /// and return the new [TextStyle].
  TextStyle? withOpacity(double opacity) =>
      this?.copyWith(color: this?.color?.withOpacity(opacity));
}
