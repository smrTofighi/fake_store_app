import 'package:flutter/material.dart';

class CustomAnimationWrapper extends StatefulWidget {
  const CustomAnimationWrapper({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  State<CustomAnimationWrapper> createState() => _CustomAnimationWrapperState();
}

class _CustomAnimationWrapperState extends State<CustomAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 650),
      vsync: this,
    );
    _animation =
        Tween<Offset>(begin: const Offset(-0.2, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
