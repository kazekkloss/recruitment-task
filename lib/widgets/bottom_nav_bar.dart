import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:task/config/size_config.dart';
import 'package:task/themes/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final bool isLandscape = SizeConfig.isLandscape;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: isLandscape ? 21.h : 10.5.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Symbols.home, 'Śląskie.', 0),
            _buildNavItem(context, Symbols.contract, 'Aktualności', 1),
            _buildNavItem(context, Symbols.calendar_month, 'Wydarzenia', 2),
            _buildNavItem(context, Symbols.map, 'Eksploruj', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index) {
    final isSelected = widget.currentIndex == index;

    return Expanded(
      child: Material(
        color: AppColors.bottomNavBackground,
        child: InkWell(
          onTap: () => widget.onItemSelected(index),
          splashColor: AppColors.accentGreen,
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  weight: 700,
                  icon,
                  color: AppColors.grey,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Text(label,
                    style: isSelected
                        ? Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.accentGreen)
                        : Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
