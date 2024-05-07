import 'package:flutter/material.dart';

class DescriptionOfProductSingle extends StatelessWidget {
  const DescriptionOfProductSingle({
    super.key,
    required this.description,
  });
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        description,
        style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
      ),
    );
  }
}