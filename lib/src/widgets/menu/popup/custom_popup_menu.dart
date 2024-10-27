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
    this.initialSelection,
    super.key,
  });

  /// The list of items to display in the popup menu.
  final List<T> items;

  /// The initial selection of the popup menu.
  final T? initialSelection;

  /// The callback to call when the popup menu selection changes.
  final OnSelected<T> onSelected;

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
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: _itemChild(item),
          ),
        )
        .toList();
  }

  Widget _buildButton(BorderRadius borderRadius) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.selectedColor,
        borderRadius: borderRadius,
      ),
      child: _itemChild(
        _selectedItem,
        customLabel: BaseIcon(context, Icons.arrow_drop_down_outlined),
      ),
    );
  }

  Row _itemChild(T? item, {Widget? customLabel}) {
    final Widget? image = item?.imageSource?.toImage(width: 26);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (image != null)
          Padding(padding: const EdgeInsets.only(right: 6), child: image),
        if (customLabel != null || item?.label != null)
          Flexible(child: customLabel ?? Text(item!.label)),
      ],
    );
  }
}
