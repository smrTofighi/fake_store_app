import 'package:flutter/material.dart';

class CustomDetailsText extends StatelessWidget {
  const CustomDetailsText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
      ),
    );
  }
}
