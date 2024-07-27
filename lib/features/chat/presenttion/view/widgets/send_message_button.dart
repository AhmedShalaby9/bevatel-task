import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_colors.dart';

class SendMessageButton extends StatefulWidget {
  const SendMessageButton({super.key});

  @override
  State<SendMessageButton> createState() => _SendMessageButtonState();
}

class _SendMessageButtonState extends State<SendMessageButton> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primary,
      radius: 25.r,
      child: const Icon(Icons.send, color: AppColors.white, size: 20),
    );
  }
}
