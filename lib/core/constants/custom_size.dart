import 'package:flutter/material.dart';

class CustomSize {
  late double _width;
  late double _height;

  CustomSize(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
  }

  double get width => _width;
  double get height => _height;
}
