/// A class that contains the parameters for the screen builder.
class ScreenBuilderParams {
  /// Creates the screen builder parameters.
  const ScreenBuilderParams({
    this.buildResponsive = true,
    this.errorTitle = 'Oops! Something went wrong',
    this.defaultExceptionMessage = 'The app encountered an unexpected error.',
    this.defaultStackTrace,
  });

  /// Whether to build the screen responsive.
  final bool buildResponsive;

  /// The error title.
  final String? errorTitle;

  /// The default exception.
  final String defaultExceptionMessage;

  /// The default stack trace.
  final StackTrace? defaultStackTrace;
}
