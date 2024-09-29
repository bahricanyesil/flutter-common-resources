import 'package:flutter/material.dart';

import '../styles/custom_paddings.dart';

/// Button styles for the application.
abstract final class CustomButtonStyles {
  /// The back button style.
  static final ButtonStyle backButtonStyle = ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    minimumSize: WidgetStateProperty.all<Size>(Size.zero),
    alignment: Alignment.centerLeft,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  /// The slidable action style.
  static final ButtonStyle slidableActionStyle = OutlinedButton.styleFrom(
    disabledForegroundColor: Colors.white.withOpacity(0.38),
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(),
    side: BorderSide.none,
    padding: CustomPaddings.medium,
  );
}
