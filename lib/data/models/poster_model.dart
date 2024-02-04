import 'package:fake_store_app/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PosterModel {
  String? title;
  String? titleButton;
  String? image;
  Color? buttonColor;
  Color? titleColor;
  Color? textButtonColor;
  List<Color>? background;

  PosterModel({
    required this.title,
    required this.titleButton,
    required this.image,
    required this.buttonColor,
    required this.background,
    required this.titleColor,
    required this.textButtonColor,
  });
}

final List<PosterModel> posterList = [
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
