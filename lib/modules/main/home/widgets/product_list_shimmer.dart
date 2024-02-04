import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/styles/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:shimmer/shimmer.dart';

class ProductListShimmer extends StatelessWidget {
  const ProductListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(
              AppDimens.small,
            ),
            width: AppDimens.sizeOfDevice(context).width * 0.42,
            height: 240,
            decoration: AppBoxDecoration.backGroundShimmer,
            child: Column(
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.grey.shade400,
                    child: Container(
                      margin: const EdgeInsets.all(AppDimens.small),
                      decoration: AppBoxDecoration.shimmer,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 12, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade400,
                            child: Container(
                              width:
                                  AppDimens.sizeOfDevice(context).width * 0.27,
                              height: 15,
                              decoration: AppBoxDecoration.shimmer,
                            ),
                          ),
                          AppDimens.small.height,
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade400,
                            child: Container(
                              width:
                                  AppDimens.sizeOfDevice(context).width * 0.18,
                              height: 15,
                              decoration: AppBoxDecoration.shimmer,
                            ),
                          )
                        ],
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade400,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: AppBoxDecoration.shimmer,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
