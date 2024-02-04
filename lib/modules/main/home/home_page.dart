import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/data/models/poster_model.dart';
import 'package:fake_store_app/gen/assets.gen.dart';
import 'package:fake_store_app/modules/main/home/controller/home_controller.dart';
import 'package:fake_store_app/modules/main/home/widgets/poster_item.dart';
import 'package:fake_store_app/modules/main/home/widgets/poster_list_shimmer.dart';
import 'package:fake_store_app/modules/main/home/widgets/product_item.dart';
import 'package:fake_store_app/modules/main/home/widgets/product_list_shimmer.dart';
import 'package:fake_store_app/modules/main/home/widgets/topic.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppDimens.large.height,
           Obx(() => homeController.isLoading.value
              ? const PosterListShimmer()
              : const PosterList(),),
      
          Topic(
            title: 'Pupolar',
            onPressed: () {},
          ),
          Obx(() => homeController.isLoading.value
              ? const ProductListShimmer()
              : PupolarProductList(),),
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
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      height: 240,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeController.pupolarProductList.length,
          itemBuilder: (context, index) {
            final String title =
                homeController.pupolarProductList[index].title!;
            final double price =
                homeController.pupolarProductList[index].price!;
            final String image =
                homeController.pupolarProductList[index].image!;
            return ProductItem(title: title, price: price, image: image);
          },
        ),
      ),
    );
  }
}

class PosterList extends StatelessWidget {
  const PosterList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      height: 120,
      child: ListView.builder(
        itemBuilder: (context, index) => PosterItem(
          index: index,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: posterList.length,
      ),
    );
  }
}
