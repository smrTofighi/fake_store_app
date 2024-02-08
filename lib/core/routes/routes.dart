import 'package:fake_store_app/core/routes/name.dart';
import 'package:fake_store_app/features/main/main_binding.dart';
import 'package:fake_store_app/features/main/main_view.dart';
import 'package:fake_store_app/features/splash/splash_view.dart';
import 'package:fake_store_app/features/user/user_sign_up_view.dart';
import 'package:fake_store_app/features/user/user_sing_in_view.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: NamePages.splashView,
    page: () => const SplashView(),
  ),
  GetPage(
    name: NamePages.userSignInView,
    page: () => UserSignInView(),
  ),
  GetPage(
    name: NamePages.userSignUpView,
    page: () => UserSignUpView(),
  ),
  GetPage(
    name: NamePages.mainView,
    page: () => MainView(),
    binding: MainBinding(),
  ),
];
