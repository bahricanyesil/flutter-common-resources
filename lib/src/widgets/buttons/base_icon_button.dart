import 'package:flutter/material.dart';

/// Icon button that is used to display an icon.
base class BaseIconButton extends IconButton {
  /// Creates a BaseIconButton.
  const BaseIconButton({
    required super.onPressed,
    required super.icon,
    EdgeInsets? padding,
    super.key,
  }) : super(
          constraints: const BoxConstraints(),
          padding: padding ?? const EdgeInsets.all(5),
        );
}
