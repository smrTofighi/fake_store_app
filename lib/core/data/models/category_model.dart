import 'package:fake_store_app/core/data/models/product_model.dart';
import 'package:get/get.dart';

class CategoryModel {
  String title;
RxList<ProductModel> productList;

  CategoryModel({required this.title, required this.productList});

  
}