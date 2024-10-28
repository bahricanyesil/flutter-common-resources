import 'package:flutter/material.dart';
import 'package:flutter_common_resources/common_resources.dart';

/// Customized code field for the application.
final class CodeField extends StatefulWidget {
  /// Creates a CodeField.
  const CodeField({
    required this.onChanged,
    this.textStyle,
    this.decoration,
    this.length = 6,
    this.onEditingCompleted,
    this.showDash,
    this.focusPrevEmptyFields = true,
    super.key,
  });

  /// The length of the code field.
  final int length;

  /// The text style of the code field
  final TextStyle? textStyle;

  /// The decoration of the code field.
  final InputDecoration? decoration;

  /// Called when the text in the code field changes.
  final ValueChanged<String> onChanged;

  /// Called when the editing is completed.
  final ValueChanged<String>? onEditingCompleted;

  /// Whether to show dash in the code field.
  final bool? showDash;

  /// Whether to focus on previous empty fields if there is any.
  final bool focusPrevEmptyFields;

  @override
  _CodeFieldState createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late final bool showDash =
      widget.showDash ?? (widget.length.isEven && widget.length > 5);

  @override
  void initState() {
    super.initState();
    _controllers = List<TextEditingController>.generate(
      widget.length,
      (_) => TextEditingController(),
    );

    _focusNodes = List<FocusNode>.generate(widget.length, _focusNodeGenerator);
  }

  FocusNode _focusNodeGenerator(int index) => FocusNode()
    ..addListener(() {
      if (_focusNodes[index].hasFocus) {
        _moveCursorToEnd(index);
      }
    });

  @override
  void dispose() {
    for (final TextEditingController controller in _controllers) {
      controller.dispose();
    }
    for (final FocusNode focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(
        widget.length + (showDash ? 1 : 0),
        _codeItemBuilder,
      ),
    );
  }

  Widget _codeItemBuilder(int index) {
    final int middleIndex = (widget.length / 2).floor();
    final bool visibleDash = middleIndex == index && showDash;
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.deviceW(0.8),
        ),
        child: visibleDash
            ? BaseIcon(context, Icons.remove_outlined, size: context.deviceW(4))
            : _codeTextField(
                (index > middleIndex && showDash) ? index - 1 : index,
              ),
      ),
    );
  }

  TextField _codeTextField(int index) {
    return TextField(
      controller: _controllers[index],
      focusNode: _focusNodes[index],
      style: widget.textStyle,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: TextInputFormatters.codeFormatter(),
      decoration: _inputDeco(),
      autofillHints: const <String>[AutofillHints.oneTimeCode],
      enableInteractiveSelection: false,
      textInputAction: index == widget.length - 1
          ? TextInputAction.done
          : TextInputAction.next,
      onChanged: (String value) => _valueOnChanged(value, index),
      onTap: () => _moveCursorToEnd(index),
    );
  }

  void _moveCursorToEnd(int index) {
    final TextEditingController controller = _controllers[index];
    if (widget.focusPrevEmptyFields) {
      final bool focused = _focusPreviousEmptyField(index);
      if (focused) return;
    }
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  bool _focusPreviousEmptyField(int currIndex) {
    int preEmptyIndex = -1;
    for (int i = 0; i < currIndex; i++) {
      if (_controllers[i].text.isEmpty) {
        preEmptyIndex = i;
        break;
      }
    }
    if (preEmptyIndex != -1) {
      _focusNodes[preEmptyIndex].requestFocus();
      return true;
    }
    return false;
  }

  void _valueOnChanged(String value, int index) {
    final TextEditingController controller = _controllers[index];
    _clearAndSet(controller, value);
    _moveCursorToEnd(index);
    _adjustFieldFocuses(value, index);
    widget.onChanged(_completeCode());
  }

  void _adjustFieldFocuses(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].nextFocus();
      } else {
        _focusNodes[index].unfocus();
        widget.onEditingCompleted?.call(_completeCode());
      }
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].previousFocus();
    }
  }

  void _clearAndSet(TextEditingController controller, String value) {
    if (value.length > 1) controller.text = value.substring(value.length - 1);
  }

  String _completeCode() {
    return _controllers
        .map((TextEditingController controller) => controller.text)
        .join();
  }

  InputDecoration _inputDeco() {
    final double size = context.deviceW(11);
    return InputDecoration(
      constraints: BoxConstraints.tight(Size(size, size)),
      contentPadding: EdgeInsets.zero,
      isDense: false,
    );
  }
}
