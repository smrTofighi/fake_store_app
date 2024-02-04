import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  const Topic({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDimens.medium, AppDimens.small, AppDimens.medium, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                const TextStyle(fontFamily: FontFamily.poppins, fontSize: 18),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'See all',
              style: TextStyle(color: TextColor.grey),
            ),
          ),
        ],
      ),
    );
  }
}
