import 'package:flutter/material.dart';
import 'package:flutter_common_resources/common_resources.dart';

/// Email field that allows users to enter their email.
base class EmailField extends BaseStatefulWidget {
  /// Creates a EmailField.
  const EmailField({
    this.focusNode,
    this.fieldKey,
    this.controller,
    this.valueChangeCallback,
    this.validator,
    this.labelText,
    this.inputDecoration,
    super.key,
  });

  /// Focus node for the email field.
  final FocusNode? focusNode;

  /// Key for the email field.
  final GlobalKey<FormFieldState<String>>? fieldKey;

  /// Controller for the email field.
  final TextEditingController? controller;

  /// Value change callback for the email field.
  final ValueChangeCallback? valueChangeCallback;

  /// Validator for the email field.
  final FormFieldValidator<String>? validator;

  /// Label text for the email field.
  final String? labelText;

  /// Custom input decoration.
  final InputDecoration? inputDecoration;

  @override
  BaseState<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends BaseState<EmailField>
    with BaseFieldMixin<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: internalFieldKey,
      controller: internalEditingController,
      focusNode: internalFocusNode,
      decoration: CustomInputDecorations.defaultInputDeco(
        context,
        labelText: widget.labelText,
        prefixIcon: Icons.email,
      ).mergeWith(widget.inputDecoration),
      keyboardType: TextInputType.emailAddress,
      autofillHints: const <String>[AutofillHints.email],
      autocorrect: false,
      validator: widget.validator,
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
