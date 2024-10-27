import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/context/theme_context_extensions.dart';
import 'package:flutter_common_resources/src/responsive/responsiveness_extensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/constants.dart';
import '../../state/state.dart';
import '../../theme/app_colors.dart';
import '../texts/base_text.dart';

/// Box decoration builder depending on the state of the button.
typedef ButtonDecorationBuilder = BoxDecoration Function({
  required bool isActive,
  required bool isPressed,
});

/// A customizable action button with animation, loading state, and active/inactive states.
base class BaseButton extends BaseStatefulWidget {
  /// Creates a [BaseButton].
  ///
  /// The [text] and [onPressed] parameters must not be null.
  const BaseButton({
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.animationDuration = const Duration(milliseconds: 400),
    this.isActive,
    this.width,
    this.height,
    this.loadingWidth,
    this.boxDecorationBuilder,
    super.key,
  });

  /// The text to display on the button.
  final String text;

  /// The callback that is called when the button is tapped.
  final AnyCallback? onPressed;

  /// The background color of the button.
  final Color? color;

  /// The color of the text on the button.
  final Color? textColor;

  /// The border radius of the button.
  final double? borderRadius;

  /// The padding inside the button.
  final EdgeInsets? padding;

  /// The duration of the animation when the button is pressed.
  final Duration animationDuration;

  /// Whether the button is active or not.
  final bool? isActive;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The width of the button during loading state.
  final double? loadingWidth;

  /// The builder for the box decoration of the button.
  final ButtonDecorationBuilder? boxDecorationBuilder;

  @override
  _BaseButtonState createState() => _BaseButtonState();
}

class _BaseButtonState extends BaseState<BaseButton> {
  bool _isPressed = false;
  bool _isLoading = false;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive ?? widget.onPressed != null;
  }

  @override
  void didUpdateWidget(covariant BaseButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive ||
        widget.onPressed != oldWidget.onPressed) {
      safeSetState(() {
        _isActive = widget.isActive ?? widget.onPressed != null;
      });
    }
  }

  void _onTapDown(TapDownDetails details) {
    if (_isActive && !_isLoading) {
      safeSetState(() => _isPressed = true);
    }
  }

  Future<void> _onTapUp(TapUpDetails details) async {
    if (_isActive && !_isLoading) {
      safeSetState(() {
        _isPressed = false;
        _isLoading = true;
      });
      await widget.onPressed?.call();
      safeSetState(() => _isLoading = false);
    }
  }

  void _onTapCancel() {
    if (_isActive && !_isLoading) {
      safeSetState(() => _isPressed = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: widget.animationDuration,
        curve: Curves.easeInOut,
        padding: _buttonPadding,
        width: _buttonWidth(context),
        height: _buttonHeight,
        decoration: widget.boxDecorationBuilder
            ?.call(isActive: _isActive, isPressed: _isPressed),
        child: _stateSwitcher(),
      ),
    );
  }

  EdgeInsets get _buttonPadding =>
      widget.padding ??
      EdgeInsets.symmetric(
        horizontal: context.deviceW(2),
        vertical: context.deviceH(1),
      );

  Center _stateSwitcher() {
    return Center(
      child: AnimatedSwitcher(
        duration: widget.animationDuration,
        child: _isLoading ? _loadingIndicator() : _buttonText(),
      ),
    );
  }

  BaseText _buttonText() {
    return BaseText(
      widget.text,
      style: context.bodyMedium
          ?.copyWith(color: widget.textColor ?? AppColors.whiteText),
    );
  }

  Widget _loadingIndicator() {
    return SpinKitSpinningLines(color: Colors.white, size: _indicatorWidth);
  }

  double get _indicatorWidth =>
      _buttonHeight - _buttonPadding.vertical - context.h(2.5);

  double get _buttonHeight => widget.height ?? context.h(6.8);

  double _buttonWidth(BuildContext context) {
    final double activeWidth = widget.width ?? (context.deviceW(80));
    return _isLoading
        ? (widget.loadingWidth ?? (_indicatorWidth + context.deviceW(45)))
        : activeWidth;
  }
}
