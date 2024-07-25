import 'package:flutter/material.dart';

class ButtonModel {
  double? width;
  double? height;
  double? radius;
  IconData? icon;
  Color? color;
  Color? textColor;
  TextStyle? textStyle;
  Color? borderColor;
  bool fill;
  String? title;
  VoidCallback onPress;
  bool isLoading;

  ButtonModel({
    this.fill = true,
    this.height,
    this.color,
    this.borderColor,
    this.icon,
    this.width,
    this.textColor,
    this.textStyle,
    this.title,
    this.radius,
    required this.onPress,
    this.isLoading = false,
  });
}
