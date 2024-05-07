import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fake_store_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class AppSnackBars {
  AppSnackBars._();
 static successfulSnackBar(context, {required String title,required String message}) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.success,
        color: LightColors.primary300,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
