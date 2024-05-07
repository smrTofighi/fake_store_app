import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverItem extends StatelessWidget {
  const DiscoverItem(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isActive});
  final String title;
  final Function() onTap;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: 500.milliseconds,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 45,
        decoration: isActive
            ? AppBoxDecoration.discoverItemActive
            : AppBoxDecoration.discoverItemDeactive,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: isActive ? TextColor.white : Colors.black26,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}