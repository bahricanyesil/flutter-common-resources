import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_resources/common_resources.dart';

/// Custom error widget for the app.
class CustomErrorWidget extends StatefulWidget {
  /// Creates a CustomErrorWidget.
  const CustomErrorWidget({
    required this.title,
    required this.exception,
    this.stackTrace,
    this.onRetry,
    super.key,
  });

  /// The title of the error widget.
  final String title;

  /// The exception thrown.
  final Object? exception;

  /// The stack trace of the exception.
  final StackTrace? stackTrace;

  /// The callback to be called when the retry button is pressed.
  final AnyCallback? onRetry;

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  late final ValueNotifier<bool> _inProgress;

  @override
  void initState() {
    super.initState();
    _inProgress = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _inProgress.dispose();
    super.dispose();
  }

  Future<void> _retryInitialization() async {
    _inProgress.value = true;
    await widget.onRetry!();
    _inProgress.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        child: ValueListenableBuilder<bool>(
          valueListenable: _inProgress,
          builder: _contentBuilder,
        ),
      ),
    );
  }

  Widget _contentBuilder(
    BuildContext context,
    bool isInProgress,
    Widget? child,
  ) {
    final ThemeData theme = Theme.of(context);
    final Color errorColor = theme.colorScheme.error;
    final TextTheme textTheme = theme.textTheme;
    return isInProgress
        ? const CircularProgressIndicator()
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.error_outline_rounded, size: 56, color: errorColor),
              const SizedBox(height: 14),
              Text(
                widget.title,
                style: textTheme.titleLarge?.copyWith(color: errorColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Flexible(
                child: SingleChildScrollView(
                  child: _errorMessage(textTheme, theme),
                ),
              ),
              if (widget.onRetry != null) ...<Widget>[
                const SizedBox(height: 18),
                _retryButton(),
              ],
            ],
          );
  }

  FilledButton _retryButton() {
    return FilledButton.icon(
      onPressed: _retryInitialization,
      icon: const Icon(Icons.refresh_rounded),
      label: const Text('Retry'),
    );
  }

  Text _errorMessage(TextTheme textTheme, ThemeData theme) {
    return Text(
      kDebugMode
          ? 'Error:\n${widget.exception}\n\nStack trace:\n${widget.stackTrace}'
          : 'The app encountered an unexpected error.',
      style: textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface.withOpacity(0.7),
      ),
      textAlign: TextAlign.center,
    );
  }
}
