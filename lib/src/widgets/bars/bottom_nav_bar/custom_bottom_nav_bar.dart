import 'package:flutter/material.dart';
import 'package:flutter_common_resources/common_resources.dart';

part 'bottom_nav_bar_item.dart';

/// The bottom navigation bar callback.
typedef BottomItemOnTap = void Function(BottomNavBarItem index);

/// The custom bottom navigation bar.
class CustomBottomNavBar extends StatefulWidget {
  /// Creates a new [CustomBottomNavBar] instance.
  const CustomBottomNavBar({
    required this.items,
    this.onItemTappedCallback,
    super.key,
  });

  /// The items of the bottom navigation bar.
  final List<BottomNavBarItem> items;

  /// The on item tapped callback.
  final BottomItemOnTap? onItemTappedCallback;

  @override
  CustomBottomNavBarState createState() => CustomBottomNavBarState();
}

/// The custom bottom navigation bar state.
class CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final List<AnimationController> _animationControllers =
      <AnimationController>[];

  /// The items of the bottom navigation bar.
  late final List<BottomNavBarItem> items = widget.items;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < items.length; i++) {
      _animationControllers.add(
        AnimationController(
          vsync: this,
          duration: CustomDurations.defaultDuration,
        ),
      );
    }
    _animationControllers[0].forward();
  }

  @override
  void dispose() {
    for (final AnimationController controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _animationControllers[_selectedIndex].reverse();
      _animationControllers[index].forward();
      _selectedIndex = index;
    });
    final BottomNavBarItem item = items[index];
    widget.onItemTappedCallback?.call(item);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      elevation: 8,
      padding: EdgeInsets.zero,
      child: Row(
        children: List<Widget>.generate(
          items.length,
          (int i) => Expanded(
            child: _BottomNavBarItem(
              onTap: (BottomNavBarItem item) => _onItemTapped(i),
              item: items[i],
              animation: _animationControllers[i],
              isSelected: _selectedIndex == i,
            ),
          ),
        ),
      ),
    );
  }
}
