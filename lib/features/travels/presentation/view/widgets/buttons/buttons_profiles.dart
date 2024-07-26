import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common/constants/app_colors.dart';
import '../../../../../../common/constants/lang_keys.dart';
import 'base_button_factory.dart';

class EditButtonFactory extends BaseButtonFactory {
  @override
  ButtonStyle getButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      textStyle: TextStyle(fontSize: 14.sp, color: AppColors.blackBG),
    );
  }

  @override
  IconData icon = Icons.edit;

  @override
  String label = LangKeys.edit;

  @override
  VoidCallback? onPressed = () {};
}

class DeleteButtonFactory extends BaseButtonFactory {
  @override
  ButtonStyle getButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      textStyle: TextStyle(fontSize: 14.sp),
    );
  }

  @override
  IconData icon = Icons.delete;

  @override
  String label = LangKeys.delete;

  @override
  VoidCallback? onPressed = () {};
}
