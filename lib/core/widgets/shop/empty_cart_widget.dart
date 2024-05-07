import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/gen/assets.gen.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Assets.lottie.cartIsEmpty, width: 250),
        AppDimens.small.height,
        const Text(
          'Your shopping cart is empty!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: LightColors.primary300,
          ),
        )
      ],
    );
  }
}
