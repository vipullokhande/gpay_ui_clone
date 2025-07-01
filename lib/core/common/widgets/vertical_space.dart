import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double height;
  Widget? child;

  VerticalSpace(
    this.height, {
    super.key,
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: child!,
    );
  }
}
