import 'dart:developer';

import 'package:fake_store_app/core/widgets/category/discover_item.dart';
import 'package:fake_store_app/features/main/category/main_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverList extends StatelessWidget {
  const DiscoverList({
    super.key,
    required this.activeIndex,
  });

  final RxInt activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      height: 40,
      child: GetBuilder<MainCategoryViewModel>(
        builder: (vm) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: vm.model.categoryList.length,
          itemBuilder: (context, index) {
            return Obx(
              () => DiscoverItem(
                  title: vm.model.categoryList[index].title.toUpperCase(),
                  onTap: () {
                    activeIndex.value = index;
                    log(activeIndex.value.toString());
                    if (index == 0) {
                      vm.getFirstCategoryItems();
                    } else if (index == 1) {
                      vm.getSecondCategoryItems();
                    } else {
                      vm.getCategoryItems(
                          vm.model.categoryList[index].title, index);
                    }
                  },
                  isActive: activeIndex.value == index),
            );
          },
        ),
      ),
    );
  }
}