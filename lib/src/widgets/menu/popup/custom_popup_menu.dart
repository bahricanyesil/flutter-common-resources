import 'package:flutter/material.dart';

import '../../../../common_resources.dart';

/// A callback for handling the selection of a [CustomPopupMenuItem].
typedef OnSelected<T extends CustomPopupMenuItem> = Future<bool> Function(T?);

/// A custom popup menu with a list of items.
base class CustomPopupMenu<T extends CustomPopupMenuItem>
    extends BaseStatefulWidget {
  /// Creates a custom popup menu with a list of items.
  const CustomPopupMenu({
    required this.items,
    required this.onSelected,
    this.menuBgColor,
    this.initialSelection,
    this.iconPadding,
    this.buttonPadding,
    this.buttonBgColor,
    super.key,
  });

  /// The list of items to display in the popup menu.
  final List<T> items;

  /// The initial selection of the popup menu.
  final T? initialSelection;

  /// The callback to call when the popup menu selection changes.
  final OnSelected<T> onSelected;

  /// The padding around the icon.
  final EdgeInsets? iconPadding;

  /// The padding of the button.
  final EdgeInsets? buttonPadding;

  /// The background color of the button.
  final Color? buttonBgColor;

  /// The background color of the menu.
  final Color? menuBgColor;

  @override
  BaseState<CustomPopupMenu<T>> createState() => _CustomPopupMenuState<T>();
}

class _CustomPopupMenuState<T extends CustomPopupMenuItem>
    extends BaseState<CustomPopupMenu<T>> {
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialSelection ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(6);
    return PopupMenuButton<T>(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      onSelected: _handleSelection,
      initialValue: widget.initialSelection,
      itemBuilder: _buildMenuItems,
      color: widget.menuBgColor,
      constraints: const BoxConstraints(),
      menuPadding: const EdgeInsets.symmetric(vertical: 4),
      child: _buildButton(borderRadius),
    );
  }

  Future<void> _handleSelection(T value) async {
    if (_selectedItem != value) {
      final bool isSet = await widget.onSelected(value);
      if (!isSet) return;
      safeSetState(() => _selectedItem = value);
    }
  }

  List<PopupMenuItem<T>> _buildMenuItems(BuildContext context) {
    return widget.items
        .map(
          (T item) => PopupMenuItem<T>(
            value: item,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _itemChild(context, item),
          ),
        )
        .toList();
  }

  Widget _buildButton(BorderRadius borderRadius) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.buttonBgColor ?? DefaultAppColors.selectedColor,
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding: widget.buttonPadding ?? const EdgeInsets.all(8),
        child: _itemChild(
          context,
          _selectedItem,
          customLabel: BaseIcon(context, Icons.arrow_drop_down_outlined),
        ),
      ),
    );
  }

  Row _itemChild(BuildContext context, T? item, {Widget? customLabel}) {
    final Widget? image = item?.imageSource?.toImage(width: 26);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (image != null)
          Padding(
            padding: widget.iconPadding ?? const EdgeInsets.only(right: 7),
            child: image,
          ),
        if (customLabel != null || item?.label != null)
          customLabel ?? BaseText(item!.label),
      ],
    );
  }
}
