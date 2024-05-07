import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shimmer/shimmer.dart';

class DetailsOfProductSingle extends StatelessWidget {
  const DetailsOfProductSingle(
      {super.key,
      required this.title,
      required this.category,
      required this.price,
      required this.rate});
  final String title;
  final String category;
  final double price;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 130,
                  child: Text(
                    category.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: LightColors.primary400),
                  )),
              AppDimens.small.height,
              SizedBox(
                width: AppDimens.sizeOfDevice(context).width * 0.65,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
              Text(
                '\$ $price',
                style: const TextStyle(
                    fontSize: 16,
                    color: LightColors.primary400,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            width: 70,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.radius),
                border: Border.all(color: Colors.black26, width: 1.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  rate.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Icon(
                  EvaIcons.star,
                  color: Colors.orangeAccent,
                  size: 22,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

 class DetailsProductShimmer extends StatelessWidget {
  const DetailsProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
                  baseColor: ShimmerColors.baseColor,
                  highlightColor: ShimmerColors.highlightColor,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 15,
                                  width: 120,
                                  decoration: AppBoxDecoration.backGroundShimmer,
                                ),
                                AppDimens.small.height,
                                Container(
                                  height: 23,
                                  width: 220,
                                  decoration: AppBoxDecoration.backGroundShimmer,
                                ),
                                AppDimens.small.height,
                                Container(
                                  height: 20,
                                  width: 80,
                                  decoration: AppBoxDecoration.backGroundShimmer,
                                ),
                              ],
                            ),
                            Container(
                              width: 70,
                              height: 35,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 2),
                              decoration: AppBoxDecoration.backGroundShimmer
                            ),
                          ],
                        ),
                    
                    AppDimens.medium.height,
                    Container(
                      decoration: AppBoxDecoration.backGroundShimmer,
                      height: 25,
                      width: 150,
                    ),
                    AppDimens.medium.height,
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: AppBoxDecoration.backGroundShimmer,
                      height: 18,
                      width: 300,
                    ),
                    Container(  margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: AppBoxDecoration.backGroundShimmer,
                      height: 18,
                      width: 230,
                    ),
                    Container(  margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: AppBoxDecoration.backGroundShimmer,
                      height: 18,
                      width: 280,
                    ),Container(  margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: AppBoxDecoration.backGroundShimmer,
                      height: 18,
                      width: 200,
                    ),
                    Container(  margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: AppBoxDecoration.backGroundShimmer,
                      height: 18,
                      width: 300,
                    ),
                      ],
                    ),
                  ),
                );
  }
}