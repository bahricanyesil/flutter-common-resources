import 'package:flutter/material.dart';

/// Custom circular border radii.
@immutable
abstract final class CircularBorderRadii {
  /// The small border radius: 8.
  static const BorderRadius small = BorderRadius.all(Radius.circular(8));

  /// The medium border radius: 16.
  static const BorderRadius medium = BorderRadius.all(Radius.circular(16));

  /// The large border radius: 24.
  static const BorderRadius large = BorderRadius.all(Radius.circular(24));

  /// The extra large border radius: 32.
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(32));

  /// The none border radius: 0.
  static const BorderRadius none = BorderRadius.zero;
}
