import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:flutter/material.dart';

class IconAppBar extends StatelessWidget {
  const IconAppBar({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.radius),
          border: Border.all(color: Colors.black54, width: 1.5)),
      child: Icon(
        icon,
        color: IconColors.black.withOpacity(0.8),
        size: 26,
      ),
    );
  }
}