import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_common_resources/src/extensions/context/theme_context_extensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/constants.dart';
import '../../state/state.dart';
import '../../theme/default_app_colors.dart';
import '../texts/base_text.dart';

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
    this.borderRadius = 12,
    this.padding,
    this.animationDuration = const Duration(milliseconds: 400),
    this.isActive,
    this.width,
    this.height,
    this.loadingWidth,
    this.splashColor,
    this.hoverColor,
    this.focusColor,
    this.isLoading,
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
  final double borderRadius;

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

  /// Splash color of the button.
  final Color? splashColor;

  /// Hover color of the button.
  final Color? hoverColor;

  /// Focus color of the button.
  final Color? focusColor;

  /// Whether the button is in loading state.
  final bool? isLoading;

  @override
  _BaseButtonState createState() => _BaseButtonState();
}

class _BaseButtonState extends BaseState<BaseButton> {
  late bool _isLoading = widget.isLoading ?? false;
  bool _isHovered = false;
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
        widget.onPressed != oldWidget.onPressed ||
        widget.isLoading != oldWidget.isLoading) {
      setState(() {
        _isActive = widget.isActive ?? widget.onPressed != null;
        _isLoading = widget.isLoading ?? _isLoading;
      });
    }
  }

  Future<void> _onTap() async {
    if (_isActive && !_isLoading) {
      if (widget.isLoading == null) setState(() => _isLoading = true);
      await widget.onPressed?.call();
      if (widget.isLoading == null) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      color: widget.color,
      child: InkWell(
        onTap: _isActive && !_isLoading ? _onTap : null,
        onHover: (bool isHovering) {
          if (_isHovered == isHovering) return;
          setState(() {
            _isHovered = isHovering;
          });
        },
        borderRadius: BorderRadius.circular(widget.borderRadius),
        focusColor: widget.focusColor,
        splashColor: widget.splashColor,
        hoverColor: widget.hoverColor,
        child: AnimatedContainer(
          duration: widget.animationDuration,
          curve: Curves.easeInOut,
          padding: _buttonPadding,
          width: _buttonWidth(context),
          height: _buttonHeight,
          child: _stateSwitcher(),
        ),
      ),
    );
  }

  EdgeInsets get _buttonPadding =>
      widget.padding ??
      const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 1,
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
          ?.copyWith(color: widget.textColor ?? DefaultAppColors.whiteText),
    );
  }

  Widget _loadingIndicator() {
    return SpinKitSpinningLines(color: Colors.white, size: _indicatorWidth);
  }

  double get _indicatorWidth => _buttonHeight - _buttonPadding.vertical - 1.8;

  double get _buttonHeight => widget.height ?? 6.2;

  double _buttonWidth(BuildContext context) {
    final double activeWidth = widget.width ?? 80;
    return _isLoading
        ? (widget.loadingWidth ?? (_indicatorWidth + 45))
        : activeWidth;
  }
}
