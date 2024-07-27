import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseButtonFactory {
  Widget createButton(Function()? onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,  // Corrected here
      icon: Icon(icon, size: 18.sp),
      label: Text(label),
      style: getButtonStyle(),
    );
  }

  ButtonStyle getButtonStyle();
  abstract String label;
  abstract IconData icon;
}
