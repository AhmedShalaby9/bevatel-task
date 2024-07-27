import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../../../auth/domain/model/user_model.dart';
import '../../../../../common/helper/navigation/navigation.dart';
import '../../../../../common/helper/navigation/routes.dart';

class UserCardItem extends StatelessWidget {
  final UserModel user;

  const UserCardItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation().navigateTo(routeName: AppRoutes.chatDetailsScreen, arg: user);
      },
      child: Container(
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
              user.name,
              style: TextThemes.boldTextStyle.copyWith(
                fontSize: 18.sp,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              user.email,
              style: TextThemes.style14500.copyWith(
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              user.country,
              style: TextThemes.style14500.copyWith(
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
