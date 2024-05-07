import 'package:fake_store_app/core/data/models/product_cart_model.dart';
import 'package:fake_store_app/core/utils/snackbars.dart';
import 'package:fake_store_app/features/main/shop/main_shop_model.dart';
import 'package:get/get.dart';

class MainShopViewModel extends GetxController {
  final MainShopModel _model = MainShopModel();
  MainShopModel get model => _model;
  RxBool isLoading = RxBool(false);

  increaseProduct(
    int index,
  ) {
    isLoading(true);
    _model.increaseProduct(index);
    Future.delayed(1500.milliseconds, () {
      isLoading(false);
    });
    update();
  }

  decreaseProduct(
    int index,
  ) {
    isLoading(true);
    _model.decreaseProduct(index);
    Future.delayed(1500.milliseconds, () {
      isLoading(false);
    });
    update();
  }

  addProductToCart(ProductCartModel productModel, context) {
    isLoading(true);
    _model.addProductToCart(productModel);
    update();
    Future.delayed(1500.milliseconds, () {
      AppSnackBars.successfulSnackBar(context,
          title: 'Thank You!',
          message: 'Your product has been added successfully');
      isLoading(false);
    });
  }

  payment(context) {
    isLoading(true);
    _model.payment();
    update();

    Future.delayed(1500.milliseconds, () {
      AppSnackBars.successfulSnackBar(context,
          title: 'Successful!', message: 'Your purchase was successful.');
      isLoading(false);
    });
  }
}
