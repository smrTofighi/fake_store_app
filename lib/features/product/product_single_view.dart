import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:fake_store_app/core/widgets/product/appbar_product_view.dart';
import 'package:fake_store_app/core/widgets/product/bottom_navigation_product.dart';
import 'package:fake_store_app/core/widgets/product/color_item.dart';
import 'package:fake_store_app/core/widgets/product/custom_details_text.dart';
import 'package:fake_store_app/core/widgets/product/discription_product.dart';
import 'package:fake_store_app/core/widgets/product/image_product_single.dart';
import 'package:fake_store_app/core/widgets/product/single_product_shimmer_view.dart';
import 'package:fake_store_app/core/widgets/product/size_item.dart';
import 'package:fake_store_app/core/widgets/product/details_product.dart';
import 'package:fake_store_app/features/product/product_single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSignleView extends StatelessWidget {
  ProductSignleView({super.key});

  final ProductSingleViewModel vmProduct = Get.find<ProductSingleViewModel>();

  //? this is for size list
  static final RxInt activeSizeIndex = RxInt(0);
  //? this is for color list
  static final RxInt activeColorIndex = RxInt(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          //? It will display a shimmer until the data is downloaded
          () => vmProduct.isLoading.value
              ? const SingleProductShimmerView()
              : SingleChildScrollView(
                  child: GetBuilder<ProductSingleViewModel>(
                    builder: (vm) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppBarProductSingleView(),
                        ImageOfProductSingle(
                            image: vm.model.productModel.value.image!),
                        DetailsOfProductSingle(
                          title: vm.model.productModel.value.title!,
                          category: vm.model.productModel.value.category!,
                          price: vm.model.productModel.value.price!,
                          rate: vm.model.productModel.value.rating!.rate!,
                        ),

                        //? show title, price, category and rate of the product
                        const CustomDetailsText(text: 'description'),
                        AppDimens.small.height,

                        //? show description of the product
                        DescriptionOfProductSingle(
                          description: vm.model.productModel.value.description!,
                        ),
                        AppDimens.small.height,
                        const CustomDetailsText(
                          text: 'size',
                        ),
                        AppDimens.small.height,

                        // list of size
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          width: AppDimens.sizeOfDevice(context).width,
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Obx(
                              () => SizeItem(
                                size: vm.model.productModel.value.sizes![index],
                                category: vm.model.productModel.value.category!,
                                isActive: index == activeSizeIndex.value,
                                onTap: () => activeSizeIndex(index),
                              ),
                            ),
                            itemCount:
                                vm.model.productModel.value.sizes!.length,
                          ),
                        ),
                        const CustomDetailsText(
                          text: 'color',
                        ),
                        AppDimens.small.height,

                        //? list of colors
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          height: 25,
                          width: AppDimens.sizeOfDevice(context).width,
                          child: ListView.builder(
                            itemBuilder: (context, index) => Obx(
                              () => ColorItem(
                                color:
                                    vm.model.productModel.value.colors![index],
                                isActive: index == activeColorIndex.value,
                                onTap: () => activeColorIndex(index),
                              ),
                            ),
                            itemCount:
                                vm.model.productModel.value.colors!.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        (AppDimens.large * 3.8).height
                      ],
                    ),
                  ),
                ),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBarProductSingleView(
          colorIndex: activeColorIndex.value,
          sizeIndex: activeSizeIndex.value,
        ),
      ),
    );
  }
}
