import 'package:flutter/material.dart';

class SizeItem extends StatelessWidget {
  const SizeItem(
      {super.key,
      required this.size,
      required this.isActive,
      required this.onTap,
      required this.category});
  final String size;
  final String category;
  final bool isActive;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          category == "electronics"
              ? '$size GB'
              : category == "jewelery"
                  ? '$size G'
                  : size,
          style: TextStyle(
              fontSize: 18,
              color: isActive ? Colors.black : Colors.black26,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}