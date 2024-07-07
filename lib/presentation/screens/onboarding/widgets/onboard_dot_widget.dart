
import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';

class OnboardDisplayDotWidget extends StatelessWidget {
  const OnboardDisplayDotWidget({
    super.key,
    this.bottom,
    this.left,
    this.top,
    this.right,
  });
  final double? bottom;
  final double? left;
  final double? top;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      top: top,
      left: left,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 15,
          height: 15,
          color: Colours.blueColor,
        ),
      ),
    );
  }
}
