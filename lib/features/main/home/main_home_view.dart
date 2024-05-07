
import 'dart:developer';

import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/constant/names.dart';
import 'package:fake_store_app/core/data/models/product_model.dart';
import 'package:fake_store_app/core/gen/assets.gen.dart';
import 'package:fake_store_app/core/widgets/custom_animation_wrapper.dart';
import 'package:fake_store_app/core/widgets/home/category_item.dart';
import 'package:fake_store_app/core/widgets/home/category_list_shimmer.dart';
import 'package:fake_store_app/core/widgets/home/poster_item.dart';
import 'package:fake_store_app/core/widgets/home/poster_list_shimmer.dart';
import 'package:fake_store_app/core/widgets/home/product_item.dart';
import 'package:fake_store_app/core/widgets/home/product_list_shimmer.dart';
import 'package:fake_store_app/core/widgets/home/topic.dart';
import 'package:fake_store_app/features/main/category/main_category_view.dart';
import 'package:fake_store_app/features/main/category/main_category_view_model.dart';
import 'package:fake_store_app/features/main/home/main_home_view_model.dart';
import 'package:fake_store_app/features/main/main_view.dart';
import 'package:fake_store_app/features/product/product_single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:get/get.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({Key? key}) : super(key: key);
  final MainHomeViewModel mainHomeVM = Get.find<MainHomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppDimens.large.height,
          Obx(
            () => mainHomeVM.model.categoryList.isEmpty
                ? const PosterListShimmer()
                : PosterList(),
          ),
          Topic(
            title: AppNames.pupolar,
            onPressed: () {},
            showButton: true,
          ),
          Obx(
            () => mainHomeVM.model.pupolarProductList.isEmpty
                ? const ProductListShimmer()
                : PupolarProductList(),
          ),
          Topic(
            title: AppNames.categories,
            onPressed: () {},
            showButton: false,
          ),
          Obx(
            () => mainHomeVM.model.categoryList.isEmpty
                ? const CategoryListShimmer()
                : CategoryList(),
          ),
          AppDimens.large.height,
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({
    super.key,
  });
  final homeVM = Get.find<MainHomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: GetBuilder<MainHomeViewModel>(
        builder: (wm) => CustomAnimationWrapper(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final List images = [
                Assets.icons.electronics.path,
                Assets.icons.jewelery.path,
                Assets.icons.mensClothes.path,
                Assets.icons.womenClothes.path,
              ];
              return CategoryItem(
                categoryTitle: wm.model.categoryList[index],
                image: images[index],
                onTap: () {
                  final MainCategoryViewModel vmCategiory = Get.find<MainCategoryViewModel>();
                      vmCategiory.getCategoryItems(
                          homeVM.model.categoryList[index], index+ 2);
                    
                  MainView.activeIndex(2);
                  MainCategoryView.activeIndex(index + 2);

                },
              );
            },
            itemCount: wm.model.categoryList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class PupolarProductList extends StatelessWidget {
  PupolarProductList({
    super.key,
  });
  final homeVM = Get.find<MainHomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      height: 240,
      child: GetBuilder<MainHomeViewModel>(
        builder: (wm) => CustomAnimationWrapper(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: wm.model.pupolarProductList.length,
            itemBuilder: (context, index) {
              final String title = wm.model.pupolarProductList[index].title!;
              final double price = wm.model.pupolarProductList[index].price!;
              final String image = wm.model.pupolarProductList[index].image!;
              return ProductItem(
                title: title,
                price: price,
                image: image,
                onTap: () {
                  ProductModel product = wm.model.pupolarProductList[index];
                  log(product.sizes.toString());
                  final wmProductSingle = Get.put(ProductSingleViewModel());
                  wmProductSingle.getProductDetails(product);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class PosterList extends StatelessWidget {
  PosterList({
    super.key,
  });
  final homeVM = Get.find<MainHomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      height: 120,
      child: GetBuilder<MainHomeViewModel>(
        builder: (vm) {
          return CustomAnimationWrapper(
            child: ListView.builder(
              itemBuilder: (context, index) => PosterItem(
                model: homeVM.model.posterList[index],
              ),
              scrollDirection: Axis.horizontal,
              itemCount: homeVM.model.posterList.length,
            ),
          );
        },
      ),
    );
  }
}
