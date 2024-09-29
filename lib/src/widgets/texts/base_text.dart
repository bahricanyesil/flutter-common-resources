import 'package:flutter/material.dart';

/// Base class for all text widgets. Can make customizations later on.
@immutable
final class BaseText extends Text {
  /// Creates a new instance of the [BaseText].
  const BaseText(
    super.text, {
    super.style,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.key,
  }) : super();
}
