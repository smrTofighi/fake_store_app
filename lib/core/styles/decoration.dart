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
      BoxShadow(color: Colors.black38, blurRadius: 4),
    ],
  );
  static BoxDecoration shimmer = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.radius),
    color: Colors.grey.shade500,
  );
}
