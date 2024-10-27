import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/context/context_extensions.dart';
import 'package:flutter_common_resources/src/responsive/responsiveness_extensions.dart';

/// A custom app bar widget.
@immutable
class CustomAppBar extends AppBar {
  /// Creates a new custom app bar.
  CustomAppBar(
    BuildContext context, {
    Widget? leadingWidget,
    Widget? centerWidget,
    Widget? trailingWidget,
    double horizontalMarginFactor = 4,
    double spacingFactor = 4,
    super.key,
  }) : super(
          elevation: 0,
          backgroundColor: context.themeD.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          toolbarHeight: kToolbarHeight + context.deviceH(1),
          actions: <Widget>[
            context.hBox(horizontalMarginFactor),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: leadingWidget ?? const SizedBox.expand(),
              ),
            ),
            context.hBox(spacingFactor),
            centerWidget ?? const SizedBox.shrink(),
            context.hBox(spacingFactor),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: trailingWidget ?? const SizedBox.expand(),
              ),
            ),
            context.hBox(horizontalMarginFactor),
          ],
        );
}
