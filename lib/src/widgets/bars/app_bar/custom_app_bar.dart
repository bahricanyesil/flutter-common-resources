import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/context/context_extensions.dart';

/// A custom app bar widget.
@immutable
class CustomAppBar extends AppBar {
  /// Creates a new custom app bar.
  CustomAppBar(
    BuildContext context, {
    Widget? leadingWidget,
    Widget? centerWidget,
    Widget? trailingWidget,
    double verticalMarginFactor = 1,
    super.key,
  }) : super(
          elevation: 0,
          backgroundColor: context.themeD.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          toolbarHeight: kToolbarHeight + verticalMarginFactor,
          actions: <Widget>[
            const SizedBox(width: 16),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: leadingWidget ?? const SizedBox.expand(),
              ),
            ),
            const SizedBox(width: 16),
            centerWidget ?? const SizedBox.shrink(),
            const SizedBox(width: 16),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: trailingWidget ?? const SizedBox.expand(),
              ),
            ),
            const SizedBox(width: 16),
          ],
        );
}
