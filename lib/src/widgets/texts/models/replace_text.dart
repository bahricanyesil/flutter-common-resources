import 'package:flutter/material.dart';

import '../../../constants/custom_type_definitions.dart';

/// The model for the replace text.
final class ReplaceText {
  /// Creates a new instance of the replace text.
  const ReplaceText(
    this.text, {
    this.color,
    this.onClick,
    this.underline = false,
    this.style,
  });

  /// Copies the replace value model with the given properties.
  ReplaceText copyWith({
    AnyCallback? onClick,
    Color? color,
    String? text,
    bool? underline,
    TextStyle? style,
  }) =>
      ReplaceText(
        text ?? this.text,
        onClick: onClick ?? this.onClick,
        color: color ?? this.color,
        underline: underline ?? this.underline,
        style: style ?? this.style,
      );

  /// Text itself.
  final String? text;

  /// Color of the text if any.
  final Color? color;

  /// On click callback if the text is clickable.
  final AnyCallback? onClick;

  /// Determines whether to underline the text.
  final bool underline;

  /// Style of the text.
  final TextStyle? style;
}
