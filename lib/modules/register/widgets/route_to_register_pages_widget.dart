import 'package:fake_store_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class RouteToRegisterPagesWidget extends StatelessWidget {
  const RouteToRegisterPagesWidget({
    super.key,
    required this.buttonText,
    required this.message,
    required this.onPressed,
  });
  final String buttonText;
  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(color: TextColor.grey),
        ),
        TextButton(
          onPressed: onPressed,
          
          child: Text(
            buttonText,
            style: const TextStyle(color: LightColors.primary500),
          ),
        ),
      ],
    );
  }
}