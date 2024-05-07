import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductModel {
  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.sizes,
      this.colors,
      this.colorsName});

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  List<String>? sizes;
  List<Color>? colors;
  List<String>? colorsName;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    late List<String> list;
    switch (json["category"]) {
      case 'men\'s clothing':
        list = ['S', 'M', 'L', 'XL', 'XXL'];
        break;
      case 'women\'s clothing':
        list = ['S', 'M', 'L', 'XL', 'XXL'];
        break;
      case 'electronics':
        list = ['128', '256', '512', '1024', '2048'];
        break;
      case 'jewelery':
        list = ['17', '18', '24'];
        break;
    }
    return ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
        sizes: list,
        colorsName: [
          'Black',
          'Red',
          'Blue',
          'Yellow',
          'Green',
          'Purple',
          'Pink',
        ],
        colors: [
          Colors.black,
          Colors.red,
          Colors.blue,
          Colors.yellow,
          Colors.green,
          Colors.purple,
          Colors.pink,
        ]);
  }
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );
}
