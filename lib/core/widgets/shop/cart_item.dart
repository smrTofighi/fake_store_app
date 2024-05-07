import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/data/models/product_cart_model.dart';
import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:fake_store_app/core/styles/text_styles.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:fake_store_app/core/widgets/loading.dart';
import 'package:fake_store_app/core/widgets/shop/app_icon_button.dart';
import 'package:fake_store_app/features/main/shop/main_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class CartItem extends StatelessWidget {
  CartItem(
      {super.key,
      required this.model,
      this.discount = 0,
      required this.productIndex});
  final MainShopViewModel shopVM = Get.find<MainShopViewModel>();
  final int productIndex;
  final ProductCartModel model;
  final int discount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.only(right: 8),
      width: AppDimens.sizeOfDevice(context).width,
      decoration: AppBoxDecoration.homeItemDecoration,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.small),
            width: AppDimens.sizeOfDevice(context).width * 0.23,
            child: CachedNetworkImage(
              imageUrl: model.image,
              imageBuilder: (context, imageProvider) => Container(
                padding: const EdgeInsets.all(AppDimens.small),
                child: Image(image: imageProvider),
              ),
              placeholder: (context, url) => const PlaceHolderWidget(
                color: LightColors.primary500,
                size: 32,
              ),
              errorWidget: (context, url, error) => const Icon(
                EvaIcons.wifi_off,
                color: LightColors.primary800,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimens.sizeOfDevice(context).width * .4,
                      child: Text(model.name,
                          maxLines: 2,
                          style: LightTextStyles.titleOfProductCart
                              .copyWith(overflow: TextOverflow.ellipsis)),
                    ),
                    (AppDimens.small / 2).height,
                    Row(
                      children: [
                        const Text(
                          'Size:',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        (AppDimens.small / 2).width,
                        Text(
                          model.size,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    (AppDimens.small / 2).height,
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: model.color,
                              border:
                                  Border.all(color: Colors.black12, width: 1)),
                        ),
                        Text(
                          model.colorName,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    (AppDimens.small / 2).height,
               
                    Row(children: [
                        Text(
                          '${model.price}\$',
                          style: LightTextStyles.priceOfProductCart.copyWith(fontSize: 14),
                        ),
                        AppDimens.small.width,
                        Visibility(
                            visible: discount != 0,
                            child: Row(
                              children: [
                                const Text(
                                  '12.00\$',
                                  style: LightTextStyles.oldOriceOfProductCart,
                                ),
                                AppDimens.small.width,
                                Text(
                                  '10%',
                                  style: LightTextStyles.priceOfProductCart
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                ),
                              ],
                            ))
                      ]),
                    
                    SizedBox(
                      width: AppDimens.sizeOfDevice(context).width * 0.4,
                      child: const Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Total Price:',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        (AppDimens.small / 2).width,
                        Text(
                          '${model.totalPrice}\$',
                          style: LightTextStyles.priceOfProductCart,
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIconButton(
                      icon: EvaIcons.plus,
                      backGround: LightColors.primary400,
                      iconColor: IconColors.white,
                      onTap: () {
                        if (!shopVM.isLoading.value) {
                          shopVM.increaseProduct(productIndex);
                        }
                      },
                    ),
                    Text(model.count.toString(),
                        style: LightTextStyles.priceOfProductCart),
                    AppIconButton(
                      icon: model.count == 1
                          ? EvaIcons.trash_2_outline
                          : EvaIcons.minus,
                      backGround: LightColors.primary400,
                      iconColor: IconColors.white,
                      onTap: () {
                        if (!shopVM.isLoading.value) {
                          shopVM.decreaseProduct(productIndex);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
