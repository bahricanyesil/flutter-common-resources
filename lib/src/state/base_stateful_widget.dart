import 'package:flutter/material.dart';

/// Base stateful widget for all stateful widgets
abstract class BaseStatefulWidget extends StatefulWidget {
  /// Base stateful widget constructor
  const BaseStatefulWidget({super.key});

  @override
  BaseState<BaseStatefulWidget> createState();
}

/// Base state for all stateful widgets
abstract class BaseState<T extends BaseStatefulWidget> extends State<T>
    with BaseStateMixin<T> {}

/// Base state mixin for all stateful widgets
mixin BaseStateMixin<T extends StatefulWidget> on State<T> {
  /// Safe set state method to prevent errors when the widget is unmounted
  void safeSetState(VoidCallback fn) {
    if (mounted) setState(fn);
  }
}
