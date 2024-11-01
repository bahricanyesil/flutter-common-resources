import 'package:flutter/material.dart';

/// Custom input decoration extensions.
extension InputDecorationExtensions on InputDecoration {
  /// Merges the current input decoration with another input decoration.
  InputDecoration mergeWith(InputDecoration? other) {
    return copyWith(
      icon: other?.icon ?? icon,
      iconColor: other?.iconColor ?? iconColor,
      label: other?.label ?? label,
      labelText: other?.labelText ?? labelText,
      labelStyle: other?.labelStyle ?? labelStyle,
      floatingLabelStyle: other?.floatingLabelStyle ?? floatingLabelStyle,
      helper: other?.helper ?? helper,
      helperText: other?.helperText ?? helperText,
      helperStyle: other?.helperStyle ?? helperStyle,
      helperMaxLines: other?.helperMaxLines ?? helperMaxLines,
      hintText: other?.hintText ?? hintText,
      hintStyle: other?.hintStyle ?? hintStyle,
      hintTextDirection: other?.hintTextDirection ?? hintTextDirection,
      hintMaxLines: other?.hintMaxLines ?? hintMaxLines,
      hintFadeDuration: other?.hintFadeDuration ?? hintFadeDuration,
      error: other?.error ?? error,
      errorText: other?.errorText ?? errorText,
      errorStyle: other?.errorStyle ?? errorStyle,
      errorMaxLines: other?.errorMaxLines ?? errorMaxLines,
      floatingLabelBehavior:
          other?.floatingLabelBehavior ?? floatingLabelBehavior,
      floatingLabelAlignment:
          other?.floatingLabelAlignment ?? floatingLabelAlignment,
      isCollapsed: other?.isCollapsed ?? isCollapsed,
      isDense: other?.isDense ?? isDense,
      contentPadding: other?.contentPadding ?? contentPadding,
      prefixIcon: other?.prefixIcon ?? prefixIcon,
      prefixIconConstraints:
          other?.prefixIconConstraints ?? prefixIconConstraints,
      prefix: other?.prefix ?? prefix,
      prefixText: other?.prefixText ?? prefixText,
      prefixStyle: other?.prefixStyle ?? prefixStyle,
      prefixIconColor: other?.prefixIconColor ?? prefixIconColor,
      suffixIcon: other?.suffixIcon ?? suffixIcon,
      suffix: other?.suffix ?? suffix,
      suffixText: other?.suffixText ?? suffixText,
      suffixStyle: other?.suffixStyle ?? suffixStyle,
      suffixIconColor: other?.suffixIconColor ?? suffixIconColor,
      suffixIconConstraints:
          other?.suffixIconConstraints ?? suffixIconConstraints,
      counter: other?.counter ?? counter,
      counterText: other?.counterText ?? counterText,
      counterStyle: other?.counterStyle ?? counterStyle,
      filled: other?.filled ?? filled,
      fillColor: other?.fillColor ?? fillColor,
      focusColor: other?.focusColor ?? focusColor,
      hoverColor: other?.hoverColor ?? hoverColor,
      errorBorder: other?.errorBorder ?? errorBorder,
      focusedBorder: other?.focusedBorder ?? focusedBorder,
      focusedErrorBorder: other?.focusedErrorBorder ?? focusedErrorBorder,
      disabledBorder: other?.disabledBorder ?? disabledBorder,
      enabledBorder: other?.enabledBorder ?? enabledBorder,
      border: other?.border ?? border,
      enabled: other?.enabled,
      semanticCounterText: other?.semanticCounterText ?? semanticCounterText,
      alignLabelWithHint: other?.alignLabelWithHint ?? alignLabelWithHint,
      constraints: other?.constraints ?? constraints,
    );
  }
}
