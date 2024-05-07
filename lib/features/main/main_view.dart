import 'package:fake_store_app/core/widgets/main/main_app_bar.dart';
import 'package:fake_store_app/core/widgets/main/main_bottom_bar.dart';
import 'package:fake_store_app/features/main/category/main_category_view.dart';
import 'package:fake_store_app/features/main/home/main_home_view.dart';
import 'package:fake_store_app/features/main/shop/main_shop_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);
  static final  RxInt activeIndex = RxInt(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: MainAppBar(
            showUserName: activeIndex.value == 0 ? true : false,
          ),
          body: IndexedStack(
            index: activeIndex.value,
            children: [
              MainHomeView(),
              MainShopView(),
              MainCategoryView(),
            ],
          ),
          bottomNavigationBar: MainBottomBar(activeIndex: activeIndex),
        ),
      ),
    );
  }
}
