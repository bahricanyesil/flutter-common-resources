import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'enums/size_device_type.dart';
import 'responsive_provider.dart';

/// Extensions to provide responsive design values.
extension ResponsivenessExtensions on BuildContext {
  /// Gets the screen width.
  double get screenW => select((ResponsiveProvider p) => p.screenWidth);

  /// Gets the screen height.
  double get screenH => select((ResponsiveProvider p) => p.screenHeight);

  /// Gets factored responsiveness width.
  double w(double widthFactor) =>
      select((ResponsiveProvider p) => p.getWidth(widthFactor));

  /// Gets factored responsiveness height.
  double h(double heightFactor) =>
      select((ResponsiveProvider p) => p.getHeight(heightFactor));

  /// Gets factored responsiveness font size.
  double fs(double fontSize) =>
      select((ResponsiveProvider p) => p.getFontSize(fontSize));

  /// Gets device specific factored width.
  double deviceW(double widthFactor) =>
      select((ResponsiveProvider p) => p.getDeviceDependentWidth(widthFactor));

  /// Gets device specific factored height.
  double deviceH(double heightFactor) => select(
        (ResponsiveProvider p) => p.getDeviceDependentHeight(heightFactor),
      );

  /// Gets the device specific factored font size.
  double deviceFs(double fontSize) =>
      select((ResponsiveProvider p) => p.getDeviceDependentFontSize(fontSize));

  /// Gets whether the device is in portrait or landscape mode.
  bool get isPortrait => select((ResponsiveProvider p) => p.isPortrait);

  /// Gets the device type.
  SizeDeviceType get sizeDeviceType =>
      select((ResponsiveProvider p) => p.deviceType);

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

  /// Builds horizontal box with responsive width.
  SizedBox hBox(double heightF) => SizedBox(height: h(heightF));

  /// Builds vertical box with responsive height.
  SizedBox wBox(double widthF) => SizedBox(width: w(widthF));

  /// Builds horizontal box with device specific width.
  SizedBox hDeviceBox(double widthF) => SizedBox(width: deviceH(widthF));

  /// Builds vertical box with device specific height.
  SizedBox wDeviceBox(double heightF) => SizedBox(height: deviceW(heightF));
}
