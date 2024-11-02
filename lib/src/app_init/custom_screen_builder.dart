import 'package:flutter/material.dart';
import 'package:flutter_common_resources/common_resources.dart';

/// A class that builds the screen with a custom error widget.
abstract final class CustomScreenBuilder {
  /// Builds the screen with a custom error widget.
  static Widget defaultBuilder(
    BuildContext context,
    Widget? child,
    AnyCallback? onRetry, {
    ScreenBuilderParams params = const ScreenBuilderParams(),
  }) {
    Widget error = CustomErrorWidget(
      title: params.errorTitle ?? _errorTitle,
      exception: Exception(params.defaultExceptionMessage),
      stackTrace: params.defaultStackTrace,
      onRetry: onRetry,
    );

    if (child is Scaffold || child is Navigator || child is Router) {
      error = Scaffold(body: SafeArea(child: Center(child: error)));
    }
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return CustomErrorWidget(
        title: params.errorTitle ?? _errorTitle,
        exception:
            Exception('${errorDetails.exception}\n\n${errorDetails.exception}'),
        stackTrace: errorDetails.stack,
        onRetry: onRetry,
      );
    };
    if (child != null) {
      if (!params.buildResponsive) return child;
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveUpdaterWidget(child: child);
        },
      );
    }
    throw StateError('Widget is null.');
  }

  static const String _errorTitle = 'Oops! Something went wrong';
}
