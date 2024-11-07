import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final bool? centre;
  final bool? isAppBarExpanded;
  final VoidCallback onTap;
  const CircleButton({super.key, required this.onTap, this.isAppBarExpanded, this.centre});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: centre != null ? const Alignment(0, 0) : const Alignment(0, 1),
          child: centre != null
              ? const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 37,
                )
              : Icon(
                  isAppBarExpanded != null
                      ? isAppBarExpanded! == true
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 37,
                ),
        ),
      ),
    );
  }
}

class RectangleButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String text;
  const RectangleButton({super.key, required this.onTap, required this.isSelected, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 105,
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: isSelected
                ? Theme.of(context).textTheme.bodyMedium
                : Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(68, 68, 69, 1),
                    ),
          ),
        ),
      ),
    );
  }
}
