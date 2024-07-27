import 'package:bevatel_task/features/chat/domain/models/chat_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/text_themes.dart';

class MessageCard extends StatelessWidget {
  final ChatModel chat;
  final bool isSentByMe;

  const MessageCard({super.key, required this.chat, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: isSentByMe ? AppColors.primary : AppColors.blackBG,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment:
          isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              chat.message,
              style: TextThemes.style12500.copyWith(
                color: isSentByMe ? AppColors.blackBG : AppColors.black,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              DateFormat('hh:mm a').format(chat.timestamp),
              style: TextThemes.style10500.copyWith(color: AppColors.greyMedium),
            ),
          ],
        ),
      ),
    );
  }
}
