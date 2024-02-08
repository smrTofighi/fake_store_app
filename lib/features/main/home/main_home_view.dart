import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/widgets/home/poster_item.dart';
import 'package:fake_store_app/core/widgets/home/poster_list_shimmer.dart';
import 'package:fake_store_app/core/widgets/home/product_item.dart';
import 'package:fake_store_app/core/widgets/home/product_list_shimmer.dart';
import 'package:fake_store_app/core/widgets/home/topic.dart';
import 'package:fake_store_app/features/main/home/main_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:get/get.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({Key? key}) : super(key: key);
  final MainHomeViewModel homeController = Get.find<MainHomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppDimens.large.height,
          Obx(
            () => homeController.isLoading.value
                ? const PosterListShimmer()
                : PosterList(),
          ),
          Topic(
            title: 'Pupolar',
            onPressed: () {},
          ),
          Obx(
            () => homeController.isLoading.value
                ? const ProductListShimmer()
                : PupolarProductList(),
          ),
          Topic(
            title: 'Categories',
            onPressed: () {},
          ),
        ],
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
              builder: (wm) =>  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeVM.model.pupolarProductList.length,
            itemBuilder: (context, index) {
              final String title =
                  homeVM.model.pupolarProductList[index].title!;
              final double price =
                  homeVM.model.pupolarProductList[index].price!;
              final String image =
                  homeVM.model.pupolarProductList[index].image!;
              return ProductItem(title: title, price: price, image: image);
            },
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
          return ListView.builder(
            itemBuilder: (context, index) => PosterItem(
              model: homeVM.model.posterList[index],
            ),
            scrollDirection: Axis.horizontal,
            itemCount: homeVM.model.posterList.length,
          );
        },
      ),
    );
  }
}
