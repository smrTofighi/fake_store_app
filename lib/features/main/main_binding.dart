import 'package:fake_store_app/features/main/home/main_home_view_model.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainHomeViewModel());
  }
}
