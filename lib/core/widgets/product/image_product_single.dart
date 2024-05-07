import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:fake_store_app/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shimmer/shimmer.dart';

class ImageOfProductSingle extends StatelessWidget {
  const ImageOfProductSingle({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(12),
      width: AppDimens.sizeOfDevice(context).width,
      height: AppDimens.sizeOfDevice(context).height * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius),
      ),
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
    );
  }
}

class ImageProductShimmer extends StatelessWidget {
  const ImageProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ShimmerColors.baseColor,
      highlightColor: ShimmerColors.highlightColor,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(12),
        width: AppDimens.sizeOfDevice(context).width,
        height: AppDimens.sizeOfDevice(context).height * 0.45,
        decoration:AppBoxDecoration.shimmer,
      ),
    );
  }
}
