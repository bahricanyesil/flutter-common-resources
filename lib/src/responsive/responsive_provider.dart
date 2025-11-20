// import 'dart:math';

// import 'package:flutter/material.dart';

// import 'enums/size_device_type.dart';

// /// A provider class to manage responsive design values.
// class ResponsiveProvider extends ChangeNotifier {
//   /// Base design metrics
//   /// Base width of the screen, in pixels.
//   static const double baseWidth = 375;

//   /// Base height of the screen, in pixels.
//   static const double baseHeight = 812;

//   /// Base font size of the screen, in pixels.
//   static const double baseFontSize = 16;

//   /// Device breakpoints
//   static const double _mobileBreakpoint = 600;
//   static const double _tabletBreakpoint = 1200;
//   static const double _mobileAspectRatio = 1.6;

//   /// Scaling factors
//   static const double _desktopScale = 1.5;
//   static const double _tabletScale = 1.2;
//   static const double _defaultScale = 1;

//   /// Update threshold for pixel changes.
//   static const double _updateThreshold = 10;

//   /// MediaQuery and scaling values
//   MediaQueryData? _mediaQuery;
//   double _widthScale = baseWidth / 100;
//   double _heightScale = baseHeight / 100;
//   SizeDeviceType _deviceType = SizeDeviceType.unknown;

//   bool _initialized = false;

//   /// Gets whether the provider is initialized.
//   bool get initialized => _initialized;

//   /// Initialize media query and scaling values
//   void update(BuildContext context) {
//     final MediaQueryData mediaQuery = MediaQuery.of(context);
//     final double newWidth = mediaQuery.size.width;
//     final double newHeight = mediaQuery.size.height;

//     final double widthDiff = (_mediaQuery?.size.width ?? newWidth)
//        - newWidth;
//     final double heightDiff =
//         (_mediaQuery?.size.height ?? newHeight) - newHeight;
//     if (_mediaQuery == null ||
//         widthDiff.abs() > _updateThreshold ||
//         heightDiff.abs() > _updateThreshold) {
//       _initialized = true;
//       _mediaQuery = mediaQuery;
//       _widthScale = _mediaQuery!.size.width / 100;
//       _heightScale = _mediaQuery!.size.height / 100;
//       final SizeDeviceType newDeviceType = _calculateDeviceType();
//       if (_deviceType != newDeviceType) _deviceType = newDeviceType;
//       notifyListeners();
//     }
//   }

//   /// Gets screen width.
//   double get screenWidth => _mediaQuery?.size.width ?? baseWidth;

//   /// Gets screen height.
//   double get screenHeight => _mediaQuery?.size.height ?? baseHeight;

//   /// Gets aspect ratio of the screen.
//   double get aspectRatio => screenWidth / screenHeight;

//   /// Gets safe area padding.
//   EdgeInsets get safeAreaPadding => _mediaQuery?.padding ?? EdgeInsets.zero;

//   /// Calculates the width based on the base width.
//   double getWidth(double inputWidth) => inputWidth * _widthScale;

//   /// Calculates the height based on the base height.
//   double getHeight(double inputHeight) => inputHeight * _heightScale;

//   /// Calculates the font size based on the width.
//   double getFontSize(double inputFontSize) {
//     final double scaledFontW = _widthScale * 9;
//     final double scaledFontH = _heightScale * 16;
//     final bool isFontWidth = scaledFontW < scaledFontH;
//     final double fS = inputFontSize *
//         (min(scaledFontW, scaledFontH) / (isFontWidth ? 9 : 16));
//     return fS;
//   }

//   /// Device type checks
//   /// Returns true if the device is a mobile device.
//   bool get isMobile =>
//       screenWidth < _mobileBreakpoint && aspectRatio <= _mobileAspectRatio;

//   /// Returns true if the device is a tablet device.
//   bool get isTablet =>
//       screenWidth >= _mobileBreakpoint &&
//       screenWidth < _tabletBreakpoint &&
//       aspectRatio > _mobileAspectRatio;

//   /// Returns true if the device is a desktop device.
//   bool get isDesktop => screenWidth >= _tabletBreakpoint;

//   /// Orientation checks
//   /// Returns true if the device is in portrait mode.
//   bool get isPortrait => screenHeight > screenWidth;

//   /// Returns true if the device is in landscape mode.
//   bool get isLandscape => screenWidth > screenHeight;

//   /// Gets the device type.
//   SizeDeviceType get deviceType => _deviceType;

//   SizeDeviceType _calculateDeviceType() {
//     if (isDesktop) return SizeDeviceType.desktop;
//     if (isTablet) return SizeDeviceType.tablet;
//     if (isMobile) return SizeDeviceType.mobile;
//     return SizeDeviceType.unknown;
//   }

//   double _getScaleForDeviceType() {
//     switch (_deviceType) {
//       case SizeDeviceType.desktop:
//         return _desktopScale;
//       case SizeDeviceType.tablet:
//         return _tabletScale;
//       case SizeDeviceType.mobile:
//       case SizeDeviceType.unknown:
//         return _defaultScale;
//     }
//   }

//   /// Device dependent calculations
//   double getDeviceDependentWidth(double inputWidth) {
//     return getWidth(inputWidth * _getScaleForDeviceType());
//   }

//   /// Device dependent calculations
//   double getDeviceDependentHeight(double inputHeight) {
//     return getHeight(inputHeight * _getScaleForDeviceType());
//   }

//   /// Device dependent calculations
//   double getDeviceDependentFontSize(double inputFontSize) {
//     return getFontSize(inputFontSize * _getScaleForDeviceType());
//   }

//   /// Safe area calculations
//   /// Gets safe width area by subtracting the safe are paddings.
//   double getSafeWidth(double inputWidth) {
//     final double width = getWidth(inputWidth);
//     return width - safeAreaPadding.left - safeAreaPadding.right;
//   }

//   /// Gets safe height area by subtracting the safe are paddings.
//   double getSafeHeight(double inputHeight) {
//     final double height = getHeight(inputHeight);
//     return height - safeAreaPadding.top - safeAreaPadding.bottom;
//   }
// }
