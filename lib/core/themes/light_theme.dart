import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: FontFamily.inter,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(LightColors.primary500),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(LightColors.primary100),
          ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radius),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius),
          borderSide: const BorderSide(color: LightColors.primary200)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius),
          borderSide: const BorderSide(color: LightColors.primary600)),
    ),
  );
}
