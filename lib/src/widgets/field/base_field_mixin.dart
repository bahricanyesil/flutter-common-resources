import 'dart:async';

import 'package:flutter/material.dart';
import 'package:language_manager/language_manager.dart';

import '../../di/di.dart';
import '../../state/base_stateful_widget.dart';

/// Callback for value changes.
typedef ValueChangeCallback = FutureOr<void> Function(
  String value,
  // ignore: avoid_positional_boolean_parameters
  bool isValid,
);

/// Field mixin that includes base functionalities for fields.
mixin BaseFieldMixin<T extends BaseStatefulWidget> on BaseState<T> {
  /// Key for the field.
  GlobalKey<FormFieldState<String>>? get fieldKey;

  /// Controller for the field.
  TextEditingController? get editingController;

  /// Focus node for the field.
  FocusNode? get focusNode;

  /// Callback for value changes.
  ValueChangeCallback? valueChangeCallback;

  /// Key for the field.
  GlobalKey<FormFieldState<String>>? internalFieldKey;

  /// Controller for the field.
  TextEditingController? internalEditingController;

  /// Focus node for the field.
  FocusNode? internalFocusNode;

  StreamSubscription<Locale>? _localeSubscription;
  bool _isTouched = false;

  @override
  void initState() {
    super.initState();
    internalFieldKey = fieldKey ?? GlobalKey<FormFieldState<String>>();
    internalEditingController = editingController ?? TextEditingController();
    internalEditingController?.addListener(_onValueChange);
    internalFocusNode = focusNode ?? FocusNode();
    internalFocusNode?.addListener(_onFocusChange);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localeSubscription?.cancel();
    _localeSubscription =
        DI.safeGetI<LanguageManager>()?.appLocaleStream.listen(_onLocaleChange);
  }

  @override
  void dispose() {
    internalFocusNode?.removeListener(_onFocusChange);
    internalFocusNode?.dispose();
    _localeSubscription?.cancel();
    internalEditingController?.removeListener(_onValueChange);
    internalEditingController?.dispose();
    internalFieldKey?.currentState?.dispose();
    super.dispose();
  }

  void _onLocaleChange(Locale newLocale) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (internalFieldKey?.currentState?.errorText == null) return;
      internalFieldKey?.currentState?.validate();
    });
  }

  void _onValueChange() {
    if (_isTouched) {
      Future<void>.microtask(() async {
        final bool isFieldValid =
            internalFieldKey?.currentState?.validate() ?? false;
        final String value = internalFieldKey?.currentState?.value ?? '';
        await valueChangeCallback?.call(value, isFieldValid);
      });
    }
  }

  void _onFocusChange() {
    if (!_isTouched) {
      safeSetState(() => _isTouched = true);
    }
  }
}
