import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_resources/src/extensions/input_decoration_extensions.dart';

import '../../decorations/custom_input_decorations.dart';
import '../../state/state.dart';
import 'base_field_mixin.dart';

/// Phone field that allows users to enter their phone number.
final class PhoneField extends BaseStatefulWidget {
  /// Creates a PhoneField.
  const PhoneField({
    this.focusNode,
    this.fieldKey,
    this.controller,
    this.valueChangeCallback,
    this.validator,
    this.labelText,
    this.inputDecoration,
    super.key,
  });

  /// Focus node for the phone field.
  final FocusNode? focusNode;

  /// Key for the phone field.
  final GlobalKey<FormFieldState<String>>? fieldKey;

  /// Controller for the phone field.
  final TextEditingController? controller;

  /// Value change callback for the password field.
  final ValueChangeCallback? valueChangeCallback;

  /// Validator for the name field.
  final FormFieldValidator<String>? validator;

  /// Label text for the name field.
  final String? labelText;

  /// Custom input decoration.
  final InputDecoration? inputDecoration;

  @override
  BaseState<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends BaseState<PhoneField>
    with BaseFieldMixin<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: internalFieldKey,
      controller: internalEditingController,
      focusNode: internalFocusNode,
      decoration: CustomInputDecorations.defaultInputDeco(
        context,
        labelText: widget.labelText,
        prefixIcon: Icons.phone,
      ).mergeWith(widget.inputDecoration),
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      autofillHints: const <String>[AutofillHints.telephoneNumber],
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
