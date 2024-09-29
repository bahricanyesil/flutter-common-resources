part of 'custom_bottom_nav_bar.dart';

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    required this.onTap,
    required this.item,
    required this.animation,
    this.isSelected = false,
  });
  final BottomItemOnTap onTap;
  final BottomNavBarItem item;
  final AnimationController animation;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddings.symmetricMedium,
      child: InkWell(
        onTap: () => onTap(item),
        splashColor: Theme.of(context).secondary.withOpacity(0.2),
        borderRadius: CircularBorderRadii.medium,
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            if (child == null) return const SizedBox.shrink();
            return _animatedBuilder(context, child, item);
          },
          child: CustomSpaces.extraSmallHeight,
        ),
      ),
    );
  }

  Widget _animatedBuilder(
    BuildContext context,
    Widget child,
    BottomNavBarItem item,
  ) {
    return ClipRRect(
      borderRadius: CircularBorderRadii.medium,
      child: ColoredBox(
        color: isSelected
            ? Theme.of(context).secondary.withOpacity(0.2)
            : Colors.transparent,
        child: Padding(
          padding: CustomPaddings.verticalSmall,
          child: SizedBox(height: 55, child: _itemColumn(context, child)),
        ),
      ),
    );
  }

  Widget _itemColumn(BuildContext context, Widget child) {
    final Color color = isSelected ? context.themeD.secondary : Colors.white70;
    final double itemSize = 22.5 + (animation.value * 4);
    final double textSize = 13.5 + (animation.value * 2);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(item.icon, color: color, size: itemSize),
        child,
        BaseText(
          item.text,
          style: TextStyle(fontSize: textSize, color: color),
        ),
      ],
    );
  }
}
