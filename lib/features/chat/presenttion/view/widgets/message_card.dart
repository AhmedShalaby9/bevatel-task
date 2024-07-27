import 'package:bevatel_task/common/widgets/custom_network_image.dart';
import 'package:bevatel_task/features/chat/domain/models/chat_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/text_themes.dart';

class MessageCard extends StatefulWidget {
  final ChatModel chat;
  final bool isSentByMe;

  const MessageCard({super.key, required this.chat, required this.isSentByMe});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: widget.isSentByMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
            decoration: widget.chat.imageUrl == null
                ? BoxDecoration(
                    color:
                        widget.isSentByMe ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.r,
                        offset: Offset(2.w, 2.h),
                      ),
                    ],
                  )
                : null,
            child: Column(
              crossAxisAlignment: widget.isSentByMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (widget.chat.message != null)
                  Text(
                    widget.chat.message!,
                    style: TextThemes.style14500.copyWith(
                        color: widget.isSentByMe
                            ? AppColors.white
                            : AppColors.black),
                  ),
                if (widget.chat.imageUrl != null)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: CustomNetworkImage(
                      imageUrl: widget.chat.imageUrl!,
                      height: 100.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              DateFormat.Hm().format(widget.chat.timestamp),
              style: TextThemes.style10500
                  .copyWith(color: AppColors.greyBarelyMedium),
            ),
          ),
        ],
      ),
    );
  }
}
