import 'package:flutter/material.dart';

/// Size-related extensions for responsive ui designs with context.
extension SizeContextExtensions on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);

  /// Top padding of the screen.
  double get screenTopPadding => _mediaQuery.viewPadding.top;

  /// One percent of the screen height, in terms of logical pixels.
  double get heightF => _mediaQuery.size.height * 0.01;

  /// One percent of the screen width, in terms of logical pixels.
  double get widthF => _mediaQuery.size.width * 0.01;

  /// Customized extreme low height value.
  double get extremeLowHeight => heightF * .8;

  /// Customized extreme low width value.
  double get extremeLowWidth => widthF * 1.2;

  /// Customized low height value.
  double get lowHeight => heightF * 1.5;

  /// Customized low width value.
  double get lowWidth => widthF * 2.3;

  /// Customized low-medium height value.
  double get lowMedHeight => heightF * 2.4;

  /// Customized low-medium width value.
  double get lowMedWidth => widthF * 3.5;

  /// Customized medium height value.
  double get medHeight => heightF * 4;

  /// Customized medium width value.
  double get medWidth => widthF * 4.8;

  /// Customized medium-high height value.
  double get medHighHeight => heightF * 5;

  /// Customized medium-high width value.
  double get medHighWidth => widthF * 6;

  /// Customized high height value.
  double get highHeight => heightF * 7;

  /// Customized high width value.
  double get highWidth => widthF * 8;

  /// Customized extreme high height value.
  double get extremeHighHeight => heightF * 9;

  /// Customized extreme high width value.
  double get extremeHighWidth => widthF * 10;

  /// Returns a responsive horizontal [SizedBox] to give space.
  SizedBox sizedW(double factor) => SizedBox(width: widthF * factor);

  /// Returns a responsive vertical [SizedBox] to give space.
  SizedBox sizedH(double factor) => SizedBox(height: heightF * factor);
}
