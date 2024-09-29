import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/extensions.dart';

import '../../constants/constants.dart';
import '../icons/base_icon.dart';
import '../texts/base_text.dart';

/// Custom action button specific to text widgets.
class BaseButton extends StatefulWidget {
  /// Default constructor for [BaseButton].
  const BaseButton({
    required this.onPressed,
    this.child,
    this.text,
    this.isActive = true,
    this.buttonStyle,
    this.padding,
    this.textStyle,
    this.icon,
    this.fullWidth = false,
    this.iconColor,
    this.bgColor,
    this.iconSize,
    super.key,
  }) : assert(text != null || child != null, 'Text or child must be provided');

  /// Callback that will be executed on a button press.
  final AnyCallback? onPressed;

  /// Child widget of the button.
  final Widget? child;

  /// Text that will be displayed on the button.
  final String? text;

  /// Whether the button is active or not.
  final bool isActive;

  /// Style of the button.
  final ButtonStyle? buttonStyle;

  /// Padding of the button.
  final EdgeInsets? padding;

  /// Text style of the button text.
  final TextStyle? textStyle;

  /// Icon of the button.
  final IconData? icon;

  /// Whether the button should take the full width or not.
  final bool fullWidth;

  /// Color of the icon.
  final Color? iconColor;

  /// Background color of the button.
  final Color? bgColor;

  /// Size of the icon.
  final double? iconSize;

  @override
  State<BaseButton> createState() => BaseButtonState();
}

/// State of the action button.
class BaseButtonState extends State<BaseButton> {
  bool _isLoading = false;
  double? _buttonHeight;
  late final GlobalKey _buttonKey;

  @override
  void initState() {
    super.initState();
    _buttonKey = GlobalKey();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _buttonHeight ??= _buttonKey.currentContext?.size?.height;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: widget.isActive ? localOnPressed : null,
        style: _defaultButtonStyle().merge(widget.buttonStyle),
        child: AnimatedSize(
          duration: CustomDurations.midDuration,
          child: _buttonChild,
        ),
      );

  ButtonStyle _defaultButtonStyle() {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color?>(widget.bgColor),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        widget.padding ??
            const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget get _buttonChild => SizedBox(
        key: _buttonKey,
        height: _buttonHeight,
        width: _isLoading ? _buttonHeight : null,
        child: _isLoading ? _loadingIndicator() : _loadedContent(),
      );

  Widget _loadedContent() {
    return widget.child ??
        (widget.icon != null || widget.fullWidth ? _textWithIcon : _buttonText);
  }

  Widget _loadingIndicator() => const FittedBox(
        fit: BoxFit.fill,
        child: CircularProgressIndicator.adaptive(),
      );

  Row get _textWithIcon => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: <Widget>[
          if (widget.icon != null) ...<Widget>[
            _iconWidget(),
            context.sizedW(2),
          ],
          Flexible(child: _buttonText),
        ],
      );

  Widget _iconWidget() {
    return BaseIcon(
      context,
      widget.icon,
      size: widget.iconSize,
      color: widget.iconColor,
    );
  }

  Widget get _buttonText => Visibility(
        visible: widget.text != null,
        child: BaseText(
          widget.text ?? '',
          style: widget.textStyle ?? context.titleMediumLarge,
          textAlign: TextAlign.center,
        ),
      );

  /// On pressed function.
  Future<void> localOnPressed() async {
    if (_isLoading || !widget.isActive) return;
    _switchLoading(true);
    await widget.onPressed?.call();
    _switchLoading(false);
  }

  void _switchLoading(bool val) {
    if (mounted) setState(() => _isLoading = val);
  }
}
