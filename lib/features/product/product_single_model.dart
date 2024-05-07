import 'package:fake_store_app/core/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductSingleModel {
  final Rx<ProductModel> _productModel = ProductModel().obs;
  Rx<ProductModel> get productModel => _productModel;

  initProduct(ProductModel productModel) {
    _productModel.update((val) {
      val!.title = productModel.title;
      val.rating = productModel.rating;
      val.price = productModel.price;
      val.description = productModel.description;
      val.image = productModel.image;
      val.id = productModel.id;
      val.category = productModel.category;
      val.sizes = productModel.sizes;
      val.colors = productModel.colors;
      val.colorsName = productModel.colorsName;
    });
  }
}
