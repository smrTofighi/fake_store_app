import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fake_store_app/core/constant/api.dart';
import 'package:fake_store_app/core/data/models/poster_model.dart';
import 'package:fake_store_app/core/data/models/product_model.dart';
import 'package:fake_store_app/core/data/services/dio_service.dart';
import 'package:fake_store_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainHomeModel {
  final List<PosterModel> _posterList = [];
  final List<ProductModel> _pupolarProductList = [];
  List<PosterModel> get posterList => _posterList;
  List<ProductModel> get pupolarProductList => _pupolarProductList;

  getPupolarProductList() async {
    const String url = '${AppApi.productLimit}7';
    var response = await DioService().getMethod(url);
    try {
      if (response.statusCode == 200) {
        response.data.forEach((product) {
          _pupolarProductList.add(ProductModel.fromJson(product));
        });
      }
    } on DioException catch (e) {
      log(e.toString());
    }
  }

  getPosterList() {
    final List<PosterModel> list = [
      PosterModel(
        title: 'Women dress set',
        titleButton: 'SEE MORE',
        image: Assets.images.c2.path,
        buttonColor: Colors.black,
        textButtonColor: Colors.white,
        titleColor: Colors.black,
        background: [
          Colors.grey,
          Colors.grey.shade800,
        ],
      ),
      PosterModel(
        title: 'Restocking of winter hoodies',
        titleButton: 'BUY NOW',
        image: Assets.images.c5.path,
        textButtonColor: Colors.black,
        titleColor: Colors.white,
        buttonColor: Colors.white,
        background: [
          Colors.black,
          Colors.grey.shade900,
        ],
      ),
      PosterModel(
        title: 'Men\'s clothes for father\'s day',
        titleButton: 'LIMITED',
        image: Assets.images.c7.path,
        textButtonColor: Colors.red,
        titleColor: Colors.white,
        buttonColor: Colors.white,
        background: [
          Colors.redAccent,
          Colors.red.shade300,
        ],
      ),
      PosterModel(
        title: 'Cold season, warm clothes',
        titleButton: 'BEST PRICE',
        image: Assets.images.c3.path,
        textButtonColor: Colors.brown,
        titleColor: Colors.white,
        buttonColor: Colors.white,
        background: [
          Colors.brown,
          Colors.brown.shade200,
        ],
      ),
      PosterModel(
        title: 'Leggings with a 40% discount',
        titleButton: 'SEE MORE',
        image: Assets.images.c6.path,
        textButtonColor: Colors.blue,
        titleColor: Colors.white,
        buttonColor: Colors.white,
        background: [
          Colors.blueAccent,
          Colors.blueAccent.shade200,
        ],
      ),
    ];

    _posterList.addAll(list);
  }
}
