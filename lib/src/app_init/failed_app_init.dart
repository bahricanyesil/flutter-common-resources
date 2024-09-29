import 'package:flutter/material.dart';
import 'package:flutter_common_resources/common_resources.dart';

/// A widget that displays an error message and stack trace when
/// initialization fails.
///
/// The [FailedAppInit] widget is typically used to handle initialization
/// errors in an application.
/// It takes an [error] object and a [stackTrace] as parameters
/// to display the error message and stack trace.
/// The [retryInit] function can be provided to retry the initialization process
class FailedAppInit extends StatefulWidget {
  /// A widget that displays an error message and stack trace
  /// when initialization fails.
  const FailedAppInit({
    required this.error,
    required this.stackTrace,
    this.retryInit,
    super.key,
  });

  /// Error object to display.
  final Object? error;

  /// Stack trace to display.
  final StackTrace stackTrace;

  /// Function to retry initialization.
  final Future<void> Function()? retryInit;

  @override
  State<FailedAppInit> createState() => _FailedAppInitState();
}

class _FailedAppInitState extends State<FailedAppInit> {
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
    await widget.retryInit!();
    _inProgress.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: CustomPaddings.large,
        child: Center(
          child: ValueListenableBuilder<bool>(
            valueListenable: _inProgress,
            builder: (BuildContext context, bool isInProgress, Widget? child) {
              return isInProgress
                  ? const CircularProgressIndicator()
                  : SingleChildScrollView(child: _contentColumn(context));
            },
          ),
        ),
      ),
    );
  }

  Column _contentColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _retryButtonRow(context),
        const SizedBox(height: 16),
        _errorText(context),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8),
          child: _stackTraceText(context),
        ),
      ],
    );
  }

  BaseText _stackTraceText(BuildContext context) {
    return BaseText(
      '${widget.stackTrace}',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  BaseText _errorText(BuildContext context) {
    return BaseText(
      '${widget.error}',
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: Theme.of(context).colorScheme.error),
    );
  }

  Row _retryButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BaseText(
          'Init failed',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        if (widget.retryInit != null)
          IconButton(
            icon: BaseIcon(context, Icons.refresh),
            onPressed: _retryInitialization,
          ),
      ],
    );
  }
}
