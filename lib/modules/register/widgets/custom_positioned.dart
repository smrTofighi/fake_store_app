import 'package:flutter/material.dart';

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(height: 100, width: 100, child: child),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
