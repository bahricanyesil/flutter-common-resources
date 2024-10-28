import 'package:flutter/material.dart';

/// Base class for all text widgets. Can make customizations later on.
@immutable
base class BaseText extends Text {
  /// Creates a new instance of the [BaseText].
  BaseText(
    super.text, {
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.key,
    TextStyle? style,
    bool underline = false,
  }) : super(
          style: style?.copyWith(
            decoration: underline ? TextDecoration.underline : null,
            decorationColor: style.color,
          ),
        );
}
