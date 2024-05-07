import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:flutter/material.dart';

class AppBoxDecoration {
  AppBoxDecoration._();
  static BoxDecoration backGroundShimmer = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.radius),
    color: Colors.grey.shade400,
  );
  static BoxDecoration homeItemDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.radius),
    color: Colors.white,
    boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 5, offset: const Offset(0, 4)),
    ],
  );
  static BoxDecoration shimmer = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.radius),
    color: Colors.grey.shade500,
  );

  static BoxDecoration discoverItemActive = BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.radius),
                color: LightColors.primary400,
              );

              static BoxDecoration discoverItemDeactive =  BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.radius),
                border: Border.all(color: Colors.black26, width: 1.5),
              );
}
