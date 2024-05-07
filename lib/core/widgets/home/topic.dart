import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  const Topic({
    super.key,
    required this.title,
    required this.onPressed,
    required this.showButton,
  });
  final String title;
  final Function() onPressed;
  final bool showButton;

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
          Visibility(
            visible: showButton,
            child: TextButton(
              onPressed: onPressed,
              child: const Text(
                'See all',
                style: TextStyle(color: TextColor.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
