import 'package:fake_store_app/core/widgets/main/main_app_bar.dart';
import 'package:fake_store_app/core/widgets/main/main_bottom_bar.dart';
import 'package:fake_store_app/features/main/home/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);
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
              MainHomeView(),
            ],
          ),
        ),
        bottomNavigationBar: MainBottomBar(activeIndex: activeIndex),
      ),
    );
  }

}
