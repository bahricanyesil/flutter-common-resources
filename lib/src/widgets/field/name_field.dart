import 'package:flutter/material.dart';

import '../../../common_resources.dart';
import '../../assets/lang/translations.g.dart';

/// Name field that allows users to enter their name.
final class NameField extends BaseStatefulWidget {
  /// Creates a NameField.
  const NameField({
    this.focusNode,
    this.fieldKey,
    this.controller,
    this.valueChangeCallback,
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
        labelText: context.t.auth.sign_up.name,
        prefixIcon: Icons.person_outline,
      ),
      keyboardType: TextInputType.name,
      autofillHints: const <String>[AutofillHints.name],
      autocorrect: false,
      validator: FieldValidators.name,
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
