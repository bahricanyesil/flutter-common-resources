part of 'app_init.dart';

/// A widget that displays an error message and stack trace when
/// initialization fails.
///
/// The [FailedAppInit] widget is typically used to handle initialization
/// errors in an application.
/// It takes an [error] object and a [stackTrace] as parameters
/// to display the error message and stack trace.
/// The [onRetry] function can be provided to retry the initialization process
class FailedAppInit extends StatelessWidget {
  /// A widget that displays an error message and stack trace
  /// when initialization fails.
  const FailedAppInit({
    required this.error,
    required this.stackTrace,
    this.onRetry,
    super.key,
  });

  /// Error object to display.
  final Object? error;

  /// Stack trace to display.
  final StackTrace stackTrace;

  /// Function to retry initialization.
  final AnyCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomErrorWidget(
        title: 'Oops! Something went wrong',
        exception: error,
        stackTrace: stackTrace,
        onRetry: onRetry,
      ),
    );
  }
}
