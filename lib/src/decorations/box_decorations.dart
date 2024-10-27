import 'package:flutter/material.dart';

import '../theme/default_app_colors.dart';

/// Box decorations for the app.
abstract final class BoxDecorations {
  /// The shadow that appears when the button is pressed.
  static BoxShadow pressShadow = const BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 4),
    blurRadius: 8,
  );

  /// The default button decoration.
  static BoxDecoration defaultButton({
    required Color color,
    Color? inactiveColor,
    bool isActive = true,
    bool isPressed = false,
    double? borderRadius,
  }) =>
      BoxDecoration(
        color: isActive
            ? (isPressed ? color.withOpacity(0.8) : color)
            : (inactiveColor ?? DefaultAppColors.inactive),
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        boxShadow:
            isPressed && isActive ? <BoxShadow>[] : <BoxShadow>[pressShadow],
      );
}
