import 'package:fake_store_app/core/data/models/product_model.dart';
import 'package:fake_store_app/features/main/home/main_home_model.dart';
import 'package:get/get.dart';

class MainHomeViewModel extends GetxController {
  late MainHomeModel _model;
  MainHomeModel get model => _model;
  MainHomeViewModel() {
    _model = MainHomeModel();
  }

  //? list of products pupolar
  RxList<ProductModel> pupolarProductList = RxList();
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    update();
    getHomeWidget();
    super.onInit();
  }

  void getHomeWidget() async {
    isLoading(true);
    model.getPosterList();
    model.getPupolarProductList();
    model.getCategoryList();
    update();
    Future.delayed(
      const Duration(seconds: 2),
      () => isLoading(false),
    );
  }
}
