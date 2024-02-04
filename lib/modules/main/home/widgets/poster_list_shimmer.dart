import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/styles/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PosterListShimmer extends StatelessWidget {
  const PosterListShimmer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      height: 120,
      child: ListView.builder(
        itemBuilder: (context, index) =>Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade400,
                  child: Container(
                
                margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
                width: AppDimens.sizeOfDevice(context).width * 0.65,
                decoration: AppBoxDecoration.backGroundShimmer,),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
      ),
    );
  }
}