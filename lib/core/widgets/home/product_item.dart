import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });
  final String title;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        AppDimens.small,
      ),
      width: AppDimens.sizeOfDevice(context).width * 0.42,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black38, blurRadius: 4),
        ],
      ),
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
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                      color: LightColors.primary300),
                  child: const Center(
                    child: Icon(
                      EvaIcons.arrow_right_outline,
                      color: LightColors.primary500,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
