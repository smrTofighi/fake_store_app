import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
          )
        ],
      ),
      child: const Icon(
        EvaIcons.shopping_bag_outline,
        size: 26,
      ),
    );
  }
}
