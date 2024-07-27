import 'package:bevatel_task/features/chat/domain/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/image_paths.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../../../../common/helper/navigation/navigation.dart';
import '../../../../../common/helper/navigation/routes.dart';

class ChatCardItem extends StatelessWidget {
  final ChatModel chat;

  const ChatCardItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation().navigateTo(routeName: AppRoutes.chatDetailsScreen);
      },
      child: Card(
        elevation: 0.2,
        color: AppColors.greySoft,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide.none),
        child: ListTile(
          title: Text(
            chat.title,
            style: TextThemes.style12700.copyWith(color: AppColors.backGround),
          ),
          subtitle: Text(
            chat.lastMessage,
            style: TextThemes.style10600.copyWith(color: AppColors.backGround),
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                chat.time,
                style: TextThemes.style8400
                    .copyWith(color: AppColors.greyBarelyMedium),
              ),
              SizedBox(height: 3.h),
            ],
          ),
          leading: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primary,
                child: const Icon(
                  Icons.person,
                  color: AppColors.black,
                ),
              ),
              SvgPicture.asset(
                ImagePaths.active,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
