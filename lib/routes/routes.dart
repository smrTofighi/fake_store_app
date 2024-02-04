import 'package:fake_store_app/modules/main/main_binding.dart';
import 'package:fake_store_app/modules/main/main_page.dart';
import 'package:fake_store_app/modules/register/sign_up_page.dart';
import 'package:fake_store_app/modules/register/sing_in_page.dart';
import 'package:fake_store_app/modules/splash/splash_page.dart';
import 'package:fake_store_app/routes/name.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: NamePages.splashPage,
    page: () => const SplashPage(),
  ),
  GetPage(
    name: NamePages.signInPage,
    page: () => SignInPage(),
  ),
  GetPage(
    name: NamePages.signUpPage,
    page: () => SignUpPage(),
  ),
  GetPage(
    name: NamePages.mainPage,
    page: () => MainPage(),
    binding: MainBinding(),
  ),
];
