import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_manager/log_manager.dart';

/// A custom [BlocObserver] that logs the lifecycle events of BLoCs.
///
/// This observer provides logging for the following events:
/// - onCreate: Called when a BLoC is created.
/// - onTransition: Called when a transition occurs in a BLoC.
/// - onEvent: Called when an event is dispatched to a BLoC.
/// - onChange: Called when a BLoC's state changes.
/// - onError: Called when an error occurs in a BLoC.
/// - onClose: Called when a BLoC is closed.
class CustomBlocObserver extends BlocObserver {
  /// Constructor for the [CustomBlocObserver] class.
  const CustomBlocObserver(this._logManager);
  final LogManager _logManager;

  @override
  void onCreate(BlocBase<Object?> bloc) {
    super.onCreate(bloc);
    _logManager.lInfo('Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    _logTransitionDetails(bloc, transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    _logEventDetails(bloc, event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase<Object?> bloc, Change<Object?> change) {
    super.onChange(bloc, change);
    _logManager.lInfo('Bloc changed: ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    final String message = 'Bloc: ${bloc.runtimeType} | $error';
    _logManager.lError(message, error: error, stackTrace: stackTrace);
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    super.onClose(bloc);
    _logManager.lInfo('Bloc closed: ${bloc.runtimeType}');
  }

  void _logTransitionDetails(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    final Object? transitionEvent = transition.event;
    final StringBuffer buffer = StringBuffer()
      ..write('Bloc: ${bloc.runtimeType} | ')
      ..writeln('${transitionEvent.runtimeType}')
      ..write('Transition: ${transition.currentState.runtimeType}')
      ..writeln(' => ${transition.nextState.runtimeType}')
      ..write('New State: ${transition.nextState}');
    _logManager.lInfo(buffer.toString());
  }

  void _logEventDetails(Bloc<Object?, Object?> bloc, Object? event) {
    final StringBuffer buffer = StringBuffer()
      ..writeln('Bloc: ${bloc.runtimeType} | ${event.runtimeType}')
      ..write('Event: $event');
    _logManager.lInfo(buffer.toString());
  }
}
