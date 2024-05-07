import 'package:fake_store_app/core/data/models/product_model.dart';
import 'package:fake_store_app/core/routes/name.dart';
import 'package:fake_store_app/features/product/product_single_model.dart';
import 'package:get/get.dart';

class ProductSingleViewModel extends GetxController {
  late ProductSingleModel _model;
  ProductSingleModel get model => _model;
  ProductSingleViewModel() {
    _model = ProductSingleModel();
  }
  RxBool isLoading = RxBool(false);

   
               

  getProductDetails(ProductModel product) {
    isLoading(true);
    _model.initProduct(product);
    Get.toNamed(NamePages.productSingleView);
    Future.delayed(
      1500.milliseconds,
      () {
        
        isLoading(false);

      },
    );
  }
}
