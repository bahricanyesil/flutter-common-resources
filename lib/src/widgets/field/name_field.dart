import 'package:flutter/material.dart';

import '../../../common_resources.dart';

/// Name field that allows users to enter their name.
base class NameField extends BaseStatefulWidget {
  /// Creates a NameField.
  const NameField({
    this.focusNode,
    this.fieldKey,
    this.controller,
    this.valueChangeCallback,
    this.validator,
    this.labelText,
    this.inputDecoration,
    this.textInputAction,
    this.onFieldSubmitted,
    super.key,
  });

  /// Focus node for the name field.
  final FocusNode? focusNode;

  /// Key for the name field.
  final GlobalKey<FormFieldState<String>>? fieldKey;

  /// Controller for the name field.
  final TextEditingController? controller;

  /// Value change callback for the name field.
  final ValueChangeCallback? valueChangeCallback;

  /// Validator for the name field.
  final FormFieldValidator<String>? validator;

  /// Label text for the name field.
  final String? labelText;

  /// Custom input decoration.
  final InputDecoration? inputDecoration;

  /// Text input action for the name field.
  final TextInputAction? textInputAction;

  /// Callback for when the field is submitted.
  final ValueSetter<String>? onFieldSubmitted;

  @override
  BaseState<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends BaseState<NameField>
    with BaseFieldMixin<NameField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: internalFieldKey,
      controller: internalEditingController,
      focusNode: internalFocusNode,
      decoration: CustomInputDecorations.defaultInputDeco(
        context,
        labelText: widget.labelText,
        prefixIcon: Icons.person_outline,
      ).mergeWith(widget.inputDecoration),
      keyboardType: TextInputType.name,
      autofillHints: const <String>[AutofillHints.name],
      autocorrect: false,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  @override
  TextEditingController? get editingController => widget.controller;

  @override
  GlobalKey<FormFieldState<String>>? get fieldKey => widget.fieldKey;

  @override
  FocusNode? get focusNode => widget.focusNode;

  @override
  ValueChangeCallback? get valueChangeCallback => widget.valueChangeCallback;
}
