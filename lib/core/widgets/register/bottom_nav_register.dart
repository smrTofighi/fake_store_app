import 'package:delayed_widget/delayed_widget.dart';
import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:flutter/material.dart';

class BottomNavRegister extends StatelessWidget {
  const BottomNavRegister({
    super.key,
    required this.textButton,
    required this.onPressed,
  });
  final String textButton;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: const Duration(milliseconds: 200),
      animation: DelayedAnimations.SLIDE_FROM_TOP,
      animationDuration: const Duration(milliseconds: 300),
      child: Container(
        width: AppDimens.sizeOfDevice(context).width,
        height: 55,
        margin: const EdgeInsets.all(AppDimens.medium),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: const TextStyle(color: TextColor.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
