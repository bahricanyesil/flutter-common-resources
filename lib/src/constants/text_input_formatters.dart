import 'package:flutter/services.dart';

import 'regexes.dart';

/// The collection of custom text input formatters.
mixin TextInputFormatters {
  /// Returns a list of text input formatters that only allow code input.
  static List<TextInputFormatter> codeFormatter([int? decimalPoints]) =>
      <TextInputFormatter>[
        FilteringTextInputFormatter.allow(Regexes.numerical),
      ];

  /// Returns a list of text input formatters that only allow numeric input.
  static List<TextInputFormatter> numericFormatter([int? decimalPoints]) =>
      <TextInputFormatter>[
        CommaToDotFormatter(),
        FilteringTextInputFormatter.allow(Regexes.numerical),
        FilteringTextInputFormatter.deny(Regexes.zeroLeadInt),
        if (decimalPoints != null)
          FilteringTextInputFormatter.allow(
            Regexes.decimalForce(decimalPoints),
          ),
      ];

  /// Returns a list of text input formatters that denies space input.
  static List<TextInputFormatter> denySpace() => <TextInputFormatter>[
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ];

  /// Returns a list of text input formatters that only allow percentage input.
  static List<TextInputFormatter> percentageFormatter() => <TextInputFormatter>[
        FilteringTextInputFormatter.allow(Regexes.numerical),
        FilteringTextInputFormatter.deny(Regexes.zeroLeadInt),
      ];
}

/// A text input formatter that replaces commas with dots.
final class CommaToDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String text = newValue.text;
    return newValue.copyWith(text: text.replaceAll(',', '.'));
  }
}
