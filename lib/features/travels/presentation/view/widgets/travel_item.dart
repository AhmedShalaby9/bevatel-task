import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/lang_keys.dart';
import '../../../../../common/constants/text_themes.dart';
import 'buttons/button_factory_provider.dart';

class TravelItem extends StatelessWidget {
  const TravelItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: TextThemes.boldTextStyle.copyWith(
              fontSize: 18.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "This is a fake description ",
            style: TextThemes.style14500.copyWith(
              fontSize: 14.sp,
              color: Colors.grey[700],
            ),
            maxLines: 2,
          ),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${LangKeys.from}: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(
                  text: "London",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${LangKeys.to}: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(
                  text: "Paris",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${LangKeys.persons}: 2",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ButtonFactoryProvider.getFactory(ButtonType.edit).createButton(),
              SizedBox(width: 8.w),
              ButtonFactoryProvider.getFactory(ButtonType.delete)
                  .createButton(),
            ],
          ),
        ],
      ),
    );
  }
}
