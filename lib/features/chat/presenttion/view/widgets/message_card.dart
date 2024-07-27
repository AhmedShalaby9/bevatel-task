import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/image_paths.dart';
import '../../../../../common/constants/text_themes.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          margin: EdgeInsetsDirectional.only(
            end: 12.w,
            start: 62.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16.r),
              bottomStart: Radius.circular(16.r),
              bottomEnd: Radius.circular(16.r),
            ),
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod?",
            style: TextThemes.style12500.copyWith(color: AppColors.greyMedium),
          ),
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 62.w, end: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(ImagePaths.seen),
              Text(
                "10:45",
                style: TextThemes.style10500
                    .copyWith(color: AppColors.greyBarelyMedium),
              )
            ],
          ),
        )
      ],
    );
  }
}
