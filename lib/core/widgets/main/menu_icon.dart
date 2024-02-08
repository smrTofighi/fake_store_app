import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.radius),
          border: Border.all(color: Colors.black54, width: 1.5)),
      child: Icon(
        EvaIcons.menu,
        color: IconColors.black.withOpacity(0.8),
        size: 26,
      ),
    );
  }
}