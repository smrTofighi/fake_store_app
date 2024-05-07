import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fake_store_app/core/constant/api.dart';
import 'package:fake_store_app/core/data/models/category_model.dart';
import 'package:fake_store_app/core/data/models/product_model.dart';
import 'package:fake_store_app/core/data/services/dio_service.dart';
import 'package:get/get.dart';

class MainCategoryModel {
  final RxList<CategoryModel> _categoryList = [
    CategoryModel(
      title: 'all',
      productList: RxList(),
    ),
    CategoryModel(
      title: 'pupolar',
      productList:  RxList(),
    ),
  ].obs;

 RxList<CategoryModel> get categoryList => _categoryList;
  getCategoryItems(String category, int index) async {
    final String url = AppApi.getOnCategory + category;
    var response = await DioService().getMethod(url);
    try {
      if (response.statusCode == 200) {
        response.data.forEach((product) {
          _categoryList[index].productList.add(ProductModel.fromJson(product));
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }
  getFirstCategoryItems()async{
    const String url = AppApi.getAllProduct;
    var response = await DioService().getMethod(url);
    try {
     
      if (response.statusCode == 200) {
        response.data.forEach((product) {
          _categoryList[0].productList.add(ProductModel.fromJson(product));
          log(_categoryList[0].productList.toString());
        });
      }
    } on DioException catch (e) {
      log(e.toString());
    }
  }getSecondCategoryItems()async{
    const String url = '${AppApi.productLimit}7';
    var response = await DioService().getMethod(url);
    try {
     
      if (response.statusCode == 200) {
        response.data.forEach((product) {
          _categoryList[1].productList.add(ProductModel.fromJson(product));
         
        });
      }
    } on DioException catch (e) {
      log(e.toString());
    }
  }

  getCategoryList() async {
    const String url = AppApi.getAllCategories;
    var response = await DioService().getMethod(url);
    try {
      if (response.statusCode == 200) {
        response.data.forEach((category) {
          _categoryList.add(
            CategoryModel(
              title: category,
              productList: RxList(),
            ),
          );
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
