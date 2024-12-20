import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/extensions.dart';

import '../theme/default_app_colors.dart';
import '../widgets/icons/icons.dart';

/// Custom input decorations for the app.
abstract final class CustomInputDecorations {
  /// Default input decoration for the app.
  static InputDecoration defaultInputDeco(
    BuildContext context, {
    String? hintText,
    Widget? suffix,
    Widget? suffixIcon,
    String? labelText,
    IconData? prefixIcon,
    Widget? prefixWidget,
    InputBorder? border,
    EdgeInsets? padding,
    TextStyle? hintStyle,
    BoxConstraints? boxConstraints,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? context.bodyMedium?.withOpacity(.5),
        suffixIconConstraints: const BoxConstraints(),
        isDense: true,
        labelText: labelText,
        suffix: suffix,
        suffixIcon: suffixIcon,
        prefixIconConstraints: const BoxConstraints(),
        border: border,
        contentPadding: padding,
        prefixIcon: prefixWidget ??
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 6),
              child: BaseIcon(
                context,
                prefixIcon,
                color: DefaultAppColors.primary,
              ),
            ),
        constraints: boxConstraints ?? const BoxConstraints(maxWidth: 400),
      );
}
