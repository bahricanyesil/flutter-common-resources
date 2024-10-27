import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/custom_type_definitions.dart';
import 'models/replace_text.dart';

/// Base rich text widget that can be used for clickable texts.
@immutable
final class BaseRichText extends RichText {
  /// Creates a new instance of the [BaseRichText].
  BaseRichText(
    String text, {
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.key,
    TextStyle? style,
    AnyCallback? onClick,
    List<ReplaceText> replaceTexts = const <ReplaceText>[],
  }) : super(
          text: TextSpan(
            style: style,
            children: <TextSpan>[
              TextSpan(
                text: text,
                recognizer: TapGestureRecognizer()..onTap = onClick,
              ),
              ...replaceTexts.map(_replaceSpanBuilder),
            ],
          ),
        );

  static TextSpan _replaceSpanBuilder(ReplaceText e) {
    return TextSpan(
      text: e.text,
      recognizer: TapGestureRecognizer()..onTap = e.onClick,
      style: (e.style ?? const TextStyle()).copyWith(
        color: e.color,
        decoration: e.underline ? TextDecoration.underline : null,
      ),
    );
  }
}
