import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.isActive,
    required this.onTap,
  });
  final Color color;
  final bool isActive;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: 500.milliseconds,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color.withOpacity(isActive ? 1 : 0.3),
          border: Border.all(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}