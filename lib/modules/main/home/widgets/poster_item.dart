import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/data/models/poster_model.dart';
import 'package:fake_store_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class PosterItem extends StatelessWidget {
  const PosterItem({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
      width: AppDimens.sizeOfDevice(context).width * 0.65,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: posterList[index].background!,
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
                    posterList[index].title!,
                    style: TextStyle(
                        color: posterList[index].titleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3, horizontal: AppDimens.medium),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimens.radius),
                        color: posterList[index].buttonColor),
                    child: Text(
                      posterList[index].titleButton!,
                      style: TextStyle(
                          color: posterList[index].textButtonColor,
                          fontFamily: FontFamily.poppins),
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset(posterList[index].image!)
        ],
      ),
    );
  }
}
