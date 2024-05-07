import 'package:fake_store_app/core/data/models/product_model.dart';
import 'package:fake_store_app/core/widgets/home/product_item.dart';
import 'package:fake_store_app/features/main/category/main_category_view_model.dart';
import 'package:fake_store_app/features/product/product_single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverItemsList extends StatelessWidget {
  const DiscoverItemsList({super.key, required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainCategoryViewModel>(
      builder: (vm) => GridView.builder(
        shrinkWrap: true,
        itemCount: vm.model.categoryList[activeIndex].productList.length,
        itemBuilder: (context, index) => ProductItem(
          title: vm.model.categoryList[activeIndex].productList[index].title!,
          price: vm.model.categoryList[activeIndex].productList[index].price!,
          image: vm.model.categoryList[activeIndex].productList[index].image!,
          onTap: () {
            ProductModel product =
                vm.model.categoryList[activeIndex].productList[index];
            final wmProductSingle = Get.put(ProductSingleViewModel());
            wmProductSingle.getProductDetails(product);
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.85),
      ),
    );
  }
}