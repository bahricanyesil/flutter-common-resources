import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Bottom nav bar item class.
base class BottomNavBarItem with EquatableMixin {
  /// Creates a new bottom nav bar item.
  const BottomNavBarItem(
    this.icon,
    this.filledIcon,
    this.text,
    this.itemIndex,
  );

  /// Icon of the item.
  final IconData icon;

  /// Filled icon of the item.
  final IconData filledIcon;

  /// Text of the item.
  final String text;

  /// Index of the item.
  final int itemIndex;

  @override
  List<Object?> get props => <Object?>[icon, filledIcon, text, itemIndex];
}
