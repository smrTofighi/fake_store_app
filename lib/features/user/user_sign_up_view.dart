import 'package:delayed_widget/delayed_widget.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/core/gen/assets.gen.dart';
import 'package:fake_store_app/core/routes/name.dart';
import 'package:fake_store_app/core/widgets/register/bottom_nav_register.dart';
import 'package:fake_store_app/core/widgets/register/custom_positioned.dart';
import 'package:fake_store_app/core/widgets/register/fashino_text.dart';
import 'package:fake_store_app/core/widgets/register/register_text_field.dart';
import 'package:fake_store_app/core/widgets/register/route_to_register_pages_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:fake_store_app/core/utils/extension.dart';
import 'package:rive/rive.dart';

// ignore: must_be_immutable
class UserSignUpView extends StatelessWidget {
  UserSignUpView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;
  final RxBool isShowLoading = RxBool(false);
  final RxBool isShowConfetti = RxBool(false);
  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DelayedWidget(
          delayDuration: const Duration(milliseconds: 200),
          animation: DelayedAnimations.SLIDE_FROM_TOP,
          animationDuration: const Duration(milliseconds: 300),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppDimens.small,
                  horizontal: AppDimens.medium,
                ),
                width: AppDimens.sizeOfDevice(context).width,
                child: Column(
                  children: [
                    (AppDimens.large * 2).height,
                    const FashionText(),
                    const Spacer(),
                    Form(
                      key: _fromKey,
                      child: Column(
                        children: [
                          RegisterTextField(
                            hintText: 'Email',
                            icon: EvaIcons.email_outline,
                            controller: emailController,
                          ),
                          AppDimens.large.height,
                          RegisterTextField(
                            hintText: 'Password',
                            icon: EvaIcons.lock_outline,
                            controller: passwordController,
                          ),
                          AppDimens.medium.height,
                        ],
                      ),
                    ),
                    RouteToRegisterPagesWidget(
                      message: 'Do You have an account?',
                      buttonText: 'Sign In',
                      onPressed: () {
                        Get.offNamed(NamePages.userSignInView);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Obx(
                () => isShowLoading.value
                    ? CustomPositioned(
                        child: RiveAnimation.asset(
                          Assets.rive.check,
                          onInit: (artboard) {
                            StateMachineController controller =
                                getRiveController(artboard);
                            check = controller.findSMI('Check') as SMITrigger;
                            error = controller.findSMI('Error') as SMITrigger;
                            reset = controller.findSMI('Reset') as SMITrigger;
                          },
                        ),
                      )
                    : const SizedBox(),
              ),
              Obx(
                () => isShowConfetti.value
                    ? CustomPositioned(
                        child: Transform.scale(
                          scale: 7,
                          child: RiveAnimation.asset(
                            Assets.rive.confetti,
                            onInit: (artboard) {
                              StateMachineController controller =
                                  getRiveController(artboard);
                              confetti = controller.findSMI('Trigger explosion')
                                  as SMITrigger;
                            },
                          ),
                        ),
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavRegister(
          textButton: 'Sign Up',
          onPressed: () {
            signUp(context);
          },
        ),
      ),
    );
  }

  void signUp(BuildContext context) {
    isShowLoading(true);
    isShowConfetti(true);

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_fromKey.currentState!.validate()) {
          check.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              isShowLoading(false);

              confetti.fire();

              Future.delayed(
                const Duration(seconds: 2),
                () => Get.offNamed(NamePages.mainView),
              );
            },
          );
        } else {
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              isShowLoading(false);
            },
          );
        }
      },
    );
  }
}
