import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double width;
  Widget? child;

  HorizontalSpace(
    this.width, {
    super.key,
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: child!,
    );
  }
}
