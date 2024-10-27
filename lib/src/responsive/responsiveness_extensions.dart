import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'enums/device_type.dart';
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
  DeviceType get sizeDeviceType =>
      select((ResponsiveProvider p) => p.getDeviceType());
}
