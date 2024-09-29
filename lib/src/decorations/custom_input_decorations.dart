import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/extensions.dart';

/// Custom input decorations for the app.
abstract final class CustomInputDecorations {
  /// Default input decoration for the app.
  static InputDecoration defaultInputDeco(
    BuildContext context, {
    String? hintText,
    Widget? suffix,
    Widget? suffixIcon,
    String? labelText,
    Widget? prefixIcon,
    InputBorder? border,
    EdgeInsets? padding,
    TextStyle? hintStyle,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? context.bodyMedium?.withOpacity(.5),
        suffixIconConstraints: const BoxConstraints(),
        isDense: true,
        labelText: labelText,
        suffix: suffix,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(),
        border: border,
        contentPadding: padding,
      );
}
