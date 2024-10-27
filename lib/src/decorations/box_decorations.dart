import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/responsive/responsiveness_extensions.dart';

import '../theme/app_colors.dart';

/// Box decorations for the app.
abstract final class BoxDecorations {
  /// The shadow that appears when the button is pressed.
  static BoxShadow pressShadow = const BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 4),
    blurRadius: 8,
  );

  /// The default button decoration.
  static BoxDecoration defaultButton(
    BuildContext context, {
    required Color color,
    Color? inactiveColor,
    bool isActive = true,
    bool isPressed = false,
    double? borderRadius,
  }) =>
      BoxDecoration(
        color: isActive
            ? (isPressed ? color.withOpacity(0.8) : color)
            : (inactiveColor ?? AppColors.inactive),
        borderRadius: BorderRadius.circular(borderRadius ?? context.fs(8)),
        boxShadow:
            isPressed && isActive ? <BoxShadow>[] : <BoxShadow>[pressShadow],
      );
}
