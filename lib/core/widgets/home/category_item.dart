import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/styles/decoration.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.categoryTitle, required this.image})
      : super(key: key);
  final String categoryTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimens.small, vertical: AppDimens.small),
      padding: const EdgeInsets.all(AppDimens.small),
      width: AppDimens.sizeOfDevice(context).width * 0.27,
      height: 120,
      decoration: AppBoxDecoration.homeItemDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
            height: 55,
          ),
          Text(
            categoryTitle.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
