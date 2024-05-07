import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/widgets/main/badge_cart.dart';
import 'package:fake_store_app/features/main/shop/main_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({
    super.key,
    required this.activeIndex,
  });

  final RxInt activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 5)]),
      child: Obx(
        () => SalomonBottomBar(
          backgroundColor: Colors.white,
          selectedItemColor: LightColors.primary500,
          unselectedItemColor: Colors.grey,
          currentIndex: activeIndex.value,
          margin: const EdgeInsets.all(16),
          onTap: (index) {
            activeIndex(index);
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(EvaIcons.home_outline),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: BadgeCart(count: Get.find<MainShopViewModel>().model.products.length),
              title: const Text('Cart'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(EvaIcons.grid_outline),
              title: const Text('Category'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(EvaIcons.heart_outline),
              title: const Text('Favorite'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(EvaIcons.person_outline),
              title: const Text('Account'),
            ),
          ],
        ),
      ),
    );
  }
}
