import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListShimmer extends StatelessWidget {
  const CategoryListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: ListView.builder(
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade400,
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: AppDimens.small, vertical: AppDimens.small),
            width: AppDimens.sizeOfDevice(context).width * 0.27,
            height: 120,
            decoration: AppBoxDecoration.shimmer,
          ),
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
