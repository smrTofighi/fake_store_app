import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/data/models/poster_model.dart';
import 'package:fake_store_app/core/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class PosterItem extends StatelessWidget {
  const PosterItem({
    super.key,
    required this.model,
  });
  final PosterModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
      width: AppDimens.sizeOfDevice(context).width * 0.65,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: model.background!,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppDimens.sizeOfDevice(context).width * 0.3,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    model.title!,
                    style: TextStyle(
                        color: model.titleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3, horizontal: AppDimens.medium),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimens.radius),
                        color: model.buttonColor),
                    child: Text(
                      model.titleButton!,
                      style: TextStyle(
                          color: model.textButtonColor,
                          fontSize: 13,
                          fontFamily: FontFamily.poppins),
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset(model.image!)
        ],
      ),
    );
  }
}
