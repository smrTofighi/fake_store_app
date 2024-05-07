import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DiscoverItemsListShimmer extends StatelessWidget {
  const DiscoverItemsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade400,
        child: Container(
          margin: const EdgeInsets.all(
            AppDimens.small,
          ),
          decoration: AppBoxDecoration.shimmer,
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.85),
    );
  }
}