import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:fake_store_app/core/widgets/loading.dart';
import 'package:fake_store_app/core/widgets/shop/cart_item.dart';
import 'package:fake_store_app/core/widgets/shop/empty_cart_widget.dart';
import 'package:fake_store_app/features/main/shop/main_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainShopView extends StatelessWidget {
  MainShopView({super.key});
  final MainShopViewModel shopVM = Get.find<MainShopViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: AppDimens.sizeOfDevice(context).width,
            child: Obx(
              () => shopVM.model.products.isEmpty
                  ? const EmptyCartWidget()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: shopVM.model.products.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          GetBuilder<MainShopViewModel>(
                        builder: (vm) => CartItem(
                          model: vm.model.products[index],
                          productIndex: index,
                        ),
                      ),
                    ),
            )),
        extendBody: true,
        bottomNavigationBar: GetBuilder<MainShopViewModel>(
          builder: (vm) => Visibility(
            visible: shopVM.model.products.isNotEmpty,
            child: Container(
              padding: const EdgeInsets.only(
                  left: AppDimens.medium,
                  right: AppDimens.medium,
                  top: AppDimens.medium),
              width: AppDimens.sizeOfDevice(context).width,
              height: 220,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppDimens.radius),
                    topRight: Radius.circular(AppDimens.radius),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, -4),
                        blurRadius: 3)
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Obx(
                        () => shopVM.isLoading.value
                            ? const PlaceHolderWidget(
                                color: LightColors.primary400,
                                size: 20,
                              )
                            : Text(
                                '${shopVM.model.totalPrice}\$',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: LightColors.primary300),
                              ),
                      ),
                    ],
                  ),
                  AppDimens.small.height,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Text(
                        'FREE',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: LightColors.primary300),
                      ),
                    ],
                  ),
                  AppDimens.small.height,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Text(
                        'FREE',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: LightColors.primary300),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Obx(
                        () => shopVM.isLoading.value
                            ? const PlaceHolderWidget(
                                color: LightColors.primary400,
                                size: 20,
                              )
                            : Text(
                                '${shopVM.model.totalPrice}\$',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: LightColors.primary400),
                              ),
                      )
                    ],
                  ),
                  AppDimens.small.height,
                  Material(
                    color: LightColors.primary400,
                    borderRadius: BorderRadius.circular(AppDimens.radius),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                      splashColor: LightColors.primary300,
                      onTap: () {
                        shopVM.payment(context);
                      },
                      child: SizedBox(
                        width: AppDimens.sizeOfDevice(context).width,
                        height: 55,
                        child: Center(
                            child: Obx(
                          () => shopVM.isLoading.value
                              ? const PlaceHolderWidget(
                                  color: IconColors.white, size: 25)
                              : const Text(
                                  'Check Out',
                                  style: TextStyle(
                                      color: TextColor.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
