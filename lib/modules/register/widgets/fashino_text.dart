import 'package:fake_store_app/core/utils/extension.dart';
import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class FashionText extends StatelessWidget {
  const FashionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'WELCOME',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'FASHINO',
          style: TextStyle(
              fontSize: 28,
              color: LightColors.primary500,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontFamily: FontFamily.poppins),
        ),
        AppDimens.small.height,
        const Text(
          'The largest clothing store in the country',
          style: TextStyle(
              color: LightColors.primary700,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
