import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/gen/fonts.gen.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:fake_store_app/core/widgets/category/discover_items_list.dart';
import 'package:fake_store_app/core/widgets/category/discover_items_list_shimmer.dart';
import 'package:fake_store_app/core/widgets/category/discover_list.dart';
import 'package:fake_store_app/core/widgets/category/discover_list_shimmer.dart';
import 'package:fake_store_app/features/main/category/main_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCategoryView extends StatelessWidget {
  MainCategoryView({super.key});
  static final RxInt activeIndex = RxInt(0);

  final MainCategoryViewModel vmCategory = Get.find<MainCategoryViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DiscoverText(),
        Obx(
          () => vmCategory.model.categoryList.isEmpty
              ? const DiscoverListShimmer()
              : DiscoverList(activeIndex: activeIndex),
        ),
        AppDimens.medium.height,
        Expanded(
          child: Obx(
            () => vmCategory.model.categoryList[activeIndex.value].productList.isEmpty
                ? const DiscoverItemsListShimmer()
                : DiscoverItemsList(
                    activeIndex: activeIndex.value,
                  ),
          ),
        )
      ],
    );
  }
}

class DiscoverText extends StatelessWidget {
  const DiscoverText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Text(
        'Discover',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamily.poppins,
        ),
      ),
    );
  }
}
