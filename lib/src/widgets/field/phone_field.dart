import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../assets/lang/translations.g.dart';
import '../../decorations/custom_input_decorations.dart';
import '../../state/state.dart';
import '../../utils/field_validators.dart';
import 'base_field_mixin.dart';

/// Phone field that allows users to enter their phone number.
final class PhoneField extends BaseStatefulWidget {
  /// Creates a PhoneField.
  const PhoneField({
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
        labelText: context.t.auth.login.phone_number,
        prefixIcon: Icons.phone,
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      autofillHints: const <String>[AutofillHints.telephoneNumber],
      autocorrect: false,
      validator: FieldValidators.phone,
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
