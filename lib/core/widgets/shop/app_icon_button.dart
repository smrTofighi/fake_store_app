import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      required this.icon,
      required this.backGround,
      required this.iconColor,
      required this.onTap});
  final IconData icon;
  final Color backGround;
  final Color iconColor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: backGround,
        borderRadius: BorderRadius.circular(AppDimens.radius),
        child: InkWell(
          splashColor: LightColors.primary300,
          borderRadius: BorderRadius.circular(AppDimens.radius),
          onTap: onTap,
          child: SizedBox(
            width: 30,
            height: 30,
            child: Icon(
              icon,
              size: 22,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
