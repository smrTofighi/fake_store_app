import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DiscoverListShimmer extends StatelessWidget {
  const DiscoverListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade400,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 45,
              width: index == 0 ? 60 : 100,
              decoration: AppBoxDecoration.shimmer,
            ),
          );
        },
      ),
    );
  }
}
