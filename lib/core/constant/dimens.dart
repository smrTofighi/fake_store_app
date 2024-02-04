import 'package:flutter/cupertino.dart';

class AppDimens {
  AppDimens._();
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static Size sizeOfDevice(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static const double radius = 10.0;
}
