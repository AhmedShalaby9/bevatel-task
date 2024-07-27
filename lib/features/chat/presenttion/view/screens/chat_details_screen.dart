import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/image_paths.dart';
import '../../../../../common/constants/lang_keys.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../../../../common/widgets/custom_back_button.dart';
import '../widgets/message_card.dart';
import '../widgets/pick_image_button.dart';
import '../widgets/send_message_button.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({super.key});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                    color: AppColors.greySoft,
                    borderRadius: BorderRadius.circular(50.r)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                            color: AppColors.backGround.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(100.r)),
                        child: Text(
                          DateFormat.yMMMMd('en-US').format(DateTime.now()),
                          style: TextThemes.style10500
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const MessageCard();
                        },
                      ),
                      SizedBox(height: 80.h),
                    ],
                  ),
                ),
              ),
              _buildChatTextField(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Stack(
          //   alignment: AlignmentDirectional.topEnd,
          //   children: [
          //     const ProfileImageWidget(),
          //     SvgPicture.asset(
          //       ImagePaths.active,
          //     ),
          //   ],
          // ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Milano",
                style:
                    TextThemes.style14700.copyWith(color: AppColors.backGround),
              ),
              Text(
                LangKeys.online,
                style:
                    TextThemes.style10600.copyWith(color: AppColors.greyMedium),
              )
            ],
          )
        ],
      ),
      leading: const Padding(
        padding: EdgeInsets.all(10),
        child: CustomBackButton(),
      ),
    );
  }

  Widget _buildChatTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: TextFormField(
        controller: _chatController,
        decoration: InputDecoration(
            fillColor: AppColors.white,
            hintText: LangKeys.saySomething,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide.none),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PickImageButton(),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const SendMessageButton(),
            )),
      ),
    );
  }
}
