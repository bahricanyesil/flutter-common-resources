import 'package:equatable/equatable.dart';

import '../../../models/image_source.dart';

/// A custom dropdown item with a label, value, and enabled status.
base class CustomPopupMenuItem extends Equatable {
  /// Creates a custom dropdown item with a label, value, and enabled status.
  const CustomPopupMenuItem({
    required this.label,
    this.imageSource,
    this.enabled = true,
  });

  /// The label of the dropdown item.
  final String label;

  /// The image source of the dropdown item.
  final ImageSource? imageSource;

  /// Whether the dropdown item is enabled.
  final bool enabled;

  @override
  String toString() => label;

  @override
  List<Object?> get props => <Object?>[label];
}
