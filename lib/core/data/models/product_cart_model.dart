import 'package:flutter/material.dart';

class ProductCartModel {
  int id;
  String name;
  String image;
  String size;
  Color color;
  String colorName;
  double price;
  double totalPrice;
  int count;

  ProductCartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.size,
    required this.colorName,
    required this.color,
    required this.price,
    required this.totalPrice,
    required this.count,
  });

}