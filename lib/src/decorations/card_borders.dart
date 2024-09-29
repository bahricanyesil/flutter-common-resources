import 'package:flutter/material.dart';

import '../styles/circular_border_radii.dart';

/// Contains the card borders used in the app.
abstract final class CardBorders {
  /// The rounded border used in the app.
  static const ShapeBorder roundedBorder = RoundedRectangleBorder(
    borderRadius: CircularBorderRadii.medium,
    side: BorderSide(color: Colors.grey),
  );
}
