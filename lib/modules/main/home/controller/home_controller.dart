import 'package:dio/dio.dart';
import 'package:fake_store_app/core/constant/api.dart';
import 'package:fake_store_app/data/models/product_model.dart';
import 'package:fake_store_app/data/services/dio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //? list of products pupolar
  RxList<ProductModel> pupolarProductList = RxList();
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    getHomeWidget();
    super.onInit();
  }

  void getHomeWidget() async {
    isLoading(true);
    getPupolarProduct();
    Future.delayed(
      const Duration(seconds: 2),
      () => isLoading(false),
    );
  }

  void getPupolarProduct() async {
    const String url = '${AppApi.productLimit}7';
    var response = await DioService().getMethod(url);
    try {
      if (response.statusCode == 200) {
        response.data.forEach((product) {
          pupolarProductList.add(ProductModel.fromJson(product));
        });
      }
    } on DioException catch (e) {}
  }
}
