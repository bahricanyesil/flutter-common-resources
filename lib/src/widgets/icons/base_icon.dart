import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/context/theme_context_extensions.dart';

/// Base icon generic widget.
final class BaseIcon extends Icon {
  /// Constructor for the base icon.
  BaseIcon(
    BuildContext context,
    super.iconData, {
    Color? color,
    super.size,
    super.key,
  }) : super(color: color ?? context.titleMedium?.color);
}
