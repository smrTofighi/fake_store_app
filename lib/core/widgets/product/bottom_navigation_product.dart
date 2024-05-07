import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/data/models/product_cart_model.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:fake_store_app/core/widgets/loading.dart';
import 'package:fake_store_app/features/main/shop/main_shop_view_model.dart';
import 'package:fake_store_app/features/product/product_single_view.dart';
import 'package:fake_store_app/features/product/product_single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class BottomNavigationBarProductSingleView extends StatelessWidget {
  BottomNavigationBarProductSingleView({
    super.key,
    required this.sizeIndex,
    required this.colorIndex,
  });
  final ProductSingleViewModel productVM = Get.find<ProductSingleViewModel>();
  final MainShopViewModel shopVM = Get.find<MainShopViewModel>();
  final int sizeIndex;
  final int colorIndex;
  @override
  Widget build(BuildContext context) {
    RxBool isAddInCart = shopVM.model.products
        .any((element) => element.id == productVM.model.productModel.value.id)
        .obs;
    return Obx(
      () => Visibility(
        visible: !productVM.isLoading.value,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Material(
            color: LightColors.primary400,
            borderRadius: BorderRadius.circular(AppDimens.radius),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDimens.radius),
              splashColor: LightColors.primary300,
              onTap: isAddInCart.value
                  ? null
                  : () {
                      addCategory(isAddInCart, context);
                    },
              child: SizedBox(
                width: AppDimens.sizeOfDevice(context).width,
                height: 65,
                child: shopVM.isLoading.value
                    ? const Center(
                        child: PlaceHolderWidget(
                            color: IconColors.white, size: 30),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isAddInCart.value
                                ? EvaIcons.eye_outline
                                : EvaIcons.shopping_bag_outline,
                            color: IconColors.white,
                            size: 28,
                          ),
                          AppDimens.small.width,
                          Text(
                            isAddInCart.value ? 'Added to cart' : 'Add to cart',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  addCategory(RxBool isAddInCart, context) {
    ProductCartModel productCartModel = ProductCartModel(
      id: productVM.model.productModel.value.id!,
      name: productVM.model.productModel.value.title!,
      image: productVM.model.productModel.value.image!,
      size: productVM.model.productModel.value.sizes![sizeIndex],
      colorName: productVM.model.productModel.value.colorsName![colorIndex],
      color: productVM.model.productModel.value.colors![colorIndex],
      price: productVM.model.productModel.value.price!,
      totalPrice: productVM.model.productModel.value.price!,
      count: 1,
    );
    shopVM.addProductToCart(productCartModel, context);
    isAddInCart.value = shopVM.model.products
        .any((element) => element.id == productVM.model.productModel.value.id);

    ProductSignleView.activeColorIndex(0);
    ProductSignleView.activeSizeIndex(0);
  }
}
