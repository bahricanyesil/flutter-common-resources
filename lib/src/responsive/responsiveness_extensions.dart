import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'enums/size_device_type.dart';
import 'responsive_provider.dart';

/// Extensions to provide responsive design values.
extension ResponsivenessExtensions on BuildContext {
  /// Gets factored responsiveness width.
  double w(double widthFactor) =>
      select((ResponsiveProvider p) => p.getWidth(widthFactor));

  /// Gets factored responsiveness height.
  double h(double heightFactor) =>
      select((ResponsiveProvider p) => p.getHeight(heightFactor));

  /// Gets factored responsiveness font size.
  double fs(double fontSize) =>
      select((ResponsiveProvider p) => p.getFontSize(fontSize));

  /// Gets the device type.
  SizeDeviceType get sizeDeviceType =>
      select((ResponsiveProvider p) => p.getDeviceType());

  /// Builds a widget based on the size device type.
  Widget responsiveBuilder(
    WidgetBuilder mobileBuilder, {
    WidgetBuilder? tabletBuilder,
    WidgetBuilder? desktopBuilder,
    WidgetBuilder? unknownBuilder,
  }) {
    return switch (sizeDeviceType) {
      SizeDeviceType.mobile => mobileBuilder(this),
      SizeDeviceType.tablet => tabletBuilder?.call(this) ?? mobileBuilder(this),
      SizeDeviceType.desktop =>
        desktopBuilder?.call(this) ?? mobileBuilder(this),
      SizeDeviceType.unknown =>
        unknownBuilder?.call(this) ?? mobileBuilder(this),
    };
  }
}
