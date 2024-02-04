import 'package:fake_store_app/core/utils/extension.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/modules/main/home/home_page.dart';
import 'package:fake_store_app/modules/main/widgets/main_app_bar.dart';
import 'package:fake_store_app/modules/main/widgets/main_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final RxInt activeIndex = RxInt(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBar(),
        body: Obx(
          () => IndexedStack(
            index: activeIndex.value,
            children: [
              HomePage(),
            ],
          ),
        ),
        bottomNavigationBar: MainBottomBar(activeIndex: activeIndex),
      ),
    );
  }
}
