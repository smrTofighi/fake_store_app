import 'package:fake_store_app/modules/main/home/controller/home_controller.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
