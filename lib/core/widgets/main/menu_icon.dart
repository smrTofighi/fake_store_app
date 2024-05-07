import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon, required this.onTap})
      : super(key: key);
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.radius),
            border: Border.all(color: Colors.black26, width: 1.5)),
        child: Icon(
          icon,
          color: IconColors.black.withOpacity(0.8),
          size: 26,
        ),
      ),
    );
  }
}
