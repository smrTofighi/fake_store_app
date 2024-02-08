import 'package:fake_store_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: LightColors.primary800,
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        }
        return null;
      },
      onSaved: (email) {},
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
          ),
          prefixIconColor: LightColors.primary400),
    );
  }
}
