import 'package:bevatel_task/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelItem extends StatelessWidget {
  const TravelItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      child: Text("data"),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(12.r)),
    );
  }
}
