import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:fake_store_app/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.onTap
  });
  final String title;
  final double price;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(
          AppDimens.small,
        ),
        width: AppDimens.sizeOfDevice(context).width * 0.42,
        height: 240,
        decoration: AppBoxDecoration.homeItemDecoration,
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: image,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AppDimens.sizeOfDevice(context).width * 0.27,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '$price \$',
                          style: const TextStyle(color: LightColors.primary400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimens.radius),
                        color: LightColors.primary400),
                    child: const Center(
                      child: Icon(
                        EvaIcons.arrow_ios_forward,
                        color: IconColors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
