import 'package:fake_store_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:icons_plus/icons_plus.dart';

class BadgeCart extends StatelessWidget {
  const BadgeCart({Key? key, required this.count}) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -10, end: -10),
      badgeContent: Text(
        '$count',
        style: const TextStyle(color: TextColor.white, fontSize: 12),
      ),
      badgeAnimation: const badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: LightColors.primary500,
        padding: const EdgeInsets.all(3),
        borderRadius: BorderRadius.circular(4),
        elevation: 0,
      ),
      child: const Icon(EvaIcons.shopping_bag_outline),
    );
  }
}
