import 'package:fake_store_app/core/widgets/main/menu_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class AppBarProductSingleView extends StatelessWidget {
  const AppBarProductSingleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIcon(
              icon: EvaIcons.arrow_back,
              onTap: () {
                Get.back();
              }),
          const Text(
            'Details',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          CustomIcon(icon: EvaIcons.heart_outline, onTap: () {})
        ],
      ),
    );
  }
}