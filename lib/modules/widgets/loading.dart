import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.color, required this.size})
      : super(key: key);
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.stretchedDots(
      color: color,
      size: size,
    );
  }
}

class PlaceHolderWidget extends StatelessWidget {
  const PlaceHolderWidget({Key? key, required this.color, required this.size})
      : super(key: key);
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.prograssiveDots(
      color: color,
      size: size,
    );
  }
}
