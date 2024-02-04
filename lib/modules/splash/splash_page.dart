import 'package:delayed_widget/delayed_widget.dart';
import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/gen/assets.gen.dart';
import 'package:fake_store_app/gen/fonts.gen.dart';
import 'package:fake_store_app/modules/widgets/loading.dart';
import 'package:fake_store_app/routes/name.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offNamed(NamePages.mainPage),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.primary500,
      body: SizedBox(
        width: AppDimens.sizeOfDevice(context).width,
        child: Column(
          children: [
            const Spacer(),
            DelayedWidget(
              delayDuration: const Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_TOP,
              animationDuration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Image.asset(
                    Assets.images.logo.path,
                    color: LightIconColors.white,
                    height: 170,
                  ),
                  AppDimens.medium.height,
                  const Text(
                    'FASHINO',
                    style: TextStyle(
                        color: TextColor.white,
                        fontSize: 24,
                        fontFamily: FontFamily.poppins),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Loading(color: LightIconColors.white, size: 50),
            (AppDimens.large * 3.5).height,
            const Text(
              'Powered By VornaCode',
              style: TextStyle(
                  color: TextColor.white, fontFamily: FontFamily.inter),
            ),
            (AppDimens.large * 2.5).height,
          ],
        ),
      ),
    );
  }
}
