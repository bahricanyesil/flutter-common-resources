import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/context/context_extensions.dart';

import '../../texts/base_text.dart';

/// A custom app bar widget.
@immutable
class CustomAppBar extends AppBar {
  /// Creates a new custom app bar.
  CustomAppBar(
    BuildContext context, {
    String? title,
    List<Widget> actions = const <Widget>[],
    TextStyle? titleTextStyle,
    double? titleSpaceFactor,
    super.key,
  }) : super(
          title: _titleWidget(title, titleTextStyle, context),
          titleSpacing: context.widthF * (titleSpaceFactor ?? hSpaceFactor),
          centerTitle: false,
          actions: actions,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leadingWidth: context.widthF * 11,
        );

  static Text? _titleWidget(
    String? title,
    TextStyle? titleTextStyle,
    BuildContext context,
  ) {
    if (title == null) return null;
    return BaseText(
      title,
      textAlign: TextAlign.start,
      style: titleTextStyle ??
          context.displaySmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  /// Horizontal space factor.
  static const double hSpaceFactor = 5;
}
