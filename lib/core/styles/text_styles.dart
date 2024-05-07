import 'package:fake_store_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class LightTextStyles {
  LightTextStyles._();

  static const TextStyle priceOfProductCart = TextStyle(
      color: LightColors.primary400, fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle oldOriceOfProductCart = TextStyle(
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
    decorationColor: Colors.grey,
    fontSize: 13,
  );

  static const TextStyle titleOfProductCart = TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold);
}

class DarkTextStyles {
  DarkTextStyles._();
}

class DynamicTextStyles {
  DynamicTextStyles._();
}
