import 'package:bevatel_task/common/constants/text_field_styles.dart';
import 'package:bevatel_task/common/constants/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

ThemeData buildAppTheme(context) {
  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextThemes.bold3.copyWith(color: AppColors.blackBG) ,
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: IconThemeData(size: 28.w, color: AppColors.blackBG),
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.greySoft,
        contentPadding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
        hintStyle:
            TextThemes.style12400.copyWith(color: AppColors.greyBarelyMedium),
        border: TextFieldsStyles.disableOutlineInputBorder,
        enabledBorder: TextFieldsStyles.disableOutlineInputBorder,
        focusedBorder: TextFieldsStyles.enableOutlineInputBorder,
        errorBorder: TextFieldsStyles.errorRoundedInputBorder,
        focusedErrorBorder: TextFieldsStyles.disableOutlineInputBorder,
        errorStyle: TextThemes.style9500),
  );
}
