import 'package:fake_store_app/features/main/category/main_category_view_model.dart';
import 'package:fake_store_app/features/main/home/main_home_view_model.dart';
import 'package:fake_store_app/features/main/shop/main_shop_view_model.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainHomeViewModel());
    Get.put(MainCategoryViewModel());
    Get.put(MainShopViewModel());
  }
}
