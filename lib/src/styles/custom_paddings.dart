import 'package:flutter/material.dart';

/// Custom paddings.
@immutable
abstract final class CustomPaddings {
  /// XX small all padding: 2.
  static const EdgeInsets xxSmall = EdgeInsets.all(2);

  /// Extra small all padding: 4.
  static const EdgeInsets extraSmall = EdgeInsets.all(4);

  /// Small all padding: 8.
  static const EdgeInsets small = EdgeInsets.all(8);

  /// Medium all padding: 16.
  static const EdgeInsets medium = EdgeInsets.all(16);

  /// Large all padding: 24.
  static const EdgeInsets large = EdgeInsets.all(24);

  /// Extra large all padding: 32.
  static const EdgeInsets extraLarge = EdgeInsets.all(32);

  /// None all padding: 0.
  static const EdgeInsets none = EdgeInsets.zero;

  /// XX small horizontal padding: 2.
  static const EdgeInsets xxSmallHorizontal =
      EdgeInsets.symmetric(horizontal: 2);

  /// Extra small horizontal padding: 4.
  static const EdgeInsets extraSmallHorizontal =
      EdgeInsets.symmetric(horizontal: 4);

  /// Horizontal small padding: 8.
  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(horizontal: 8);

  /// Horizontal medium padding: 16.
  static const EdgeInsets horizontalMedium =
      EdgeInsets.symmetric(horizontal: 16);

  /// Horizontal large padding: 24.
  static const EdgeInsets horizontalLarge =
      EdgeInsets.symmetric(horizontal: 24);

  /// Horizontal extra large padding: 32.
  static const EdgeInsets horizontalExtraLarge =
      EdgeInsets.symmetric(horizontal: 32);

  /// XX small vertical padding: 2.
  static const EdgeInsets xxSmallVertical = EdgeInsets.symmetric(vertical: 2);

  /// Extra small vertical padding: 4.
  static const EdgeInsets extraSmallVertical =
      EdgeInsets.symmetric(vertical: 4);

  /// Vertical small padding: 8.
  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: 8);

  /// Vertical medium padding: 16.
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(vertical: 16);

  /// Vertical large padding: 24.
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(vertical: 24);

  /// Vertical extra large padding: 32.
  static const EdgeInsets verticalExtraLarge =
      EdgeInsets.symmetric(vertical: 32);

  /// Symmetric small padding: 8.
  static const EdgeInsets symmetricSmall =
      EdgeInsets.symmetric(horizontal: 8, vertical: 8);

  /// Symmetric medium padding: 16.
  static const EdgeInsets symmetricMedium =
      EdgeInsets.symmetric(horizontal: 16, vertical: 16);

  /// Symmetric large padding: 24.
  static const EdgeInsets symmetricLarge =
      EdgeInsets.symmetric(horizontal: 24, vertical: 24);

  /// Symmetric extra large padding: 32.
  static const EdgeInsets symmetricExtraLarge =
      EdgeInsets.symmetric(horizontal: 32, vertical: 32);
}
