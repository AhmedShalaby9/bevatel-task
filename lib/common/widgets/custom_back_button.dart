import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_colors.dart';
import '../constants/image_paths.dart';
import '../constants/lang_keys.dart';
import '../constants/text_themes.dart';
import '../helper/navigation/navigation.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({super.key});
  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation().goBack();
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.greySoft,
            borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(ImagePaths.arrowBackIcon, height: 15.h),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
