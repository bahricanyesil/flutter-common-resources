import 'package:flutter/material.dart';

import '../../assets/lang/translations.g.dart';
import '../../decorations/custom_input_decorations.dart';
import '../../state/state.dart';
import '../../theme/app_colors.dart';
import '../../utils/field_validators.dart';
import '../buttons/buttons.dart';
import '../icons/icons.dart';
import 'base_field_mixin.dart';

/// Password field that allows users to enter their password.
final class PasswordField extends BaseStatefulWidget {
  /// Creates a PasswordField.
  const PasswordField({
    this.focusNode,
    this.fieldKey,
    this.controller,
    this.valueChangeCallback,
    super.key,
  });

  /// Focus node for the password field.
  final FocusNode? focusNode;

  /// Key for the password field.
  final GlobalKey<FormFieldState<String>>? fieldKey;

  /// Controller for the password field.
  final TextEditingController? controller;

  /// Value change callback for the password field.
  final ValueChangeCallback? valueChangeCallback;

  @override
  BaseState<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends BaseState<PasswordField>
    with BaseFieldMixin<PasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) => TextFormField(
        key: internalFieldKey,
        controller: internalEditingController,
        focusNode: internalFocusNode,
        decoration: CustomInputDecorations.defaultInputDeco(
          context,
          labelText: context.t.auth.login.password,
          suffixIcon: _obscureSuffixButton(context),
          prefixIcon: Icons.lock,
        ),
        obscureText: _isObscure,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const <String>[
          AutofillHints.password,
          AutofillHints.newPassword,
        ],
        enableSuggestions: false,
        autocorrect: false,
        validator: FieldValidators.password,
      );

  BaseIconButton _obscureSuffixButton(BuildContext context) {
    return BaseIconButton(
      onPressed: () => safeSetState(() => _isObscure = !_isObscure),
      icon: BaseIcon(
        context,
        _isObscure ? Icons.visibility : Icons.visibility_off,
        color: AppColors.primary,
      ),
      padding: const EdgeInsets.all(10),
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
