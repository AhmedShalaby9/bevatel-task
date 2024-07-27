import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/lang_keys.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../../../../common/widgets/custom_back_button.dart';
import '../../../../auth/domain/model/user_model.dart';
import '../../../data/entities/chat_entity.dart';
import '../../../domain/models/chat_model.dart';
import '../../viewmodel/chat_bloc.dart';
import '../../viewmodel/chat_events.dart';
import '../../viewmodel/chat_state.dart';
import '../widgets/message_card.dart';
import '../widgets/pick_image_button.dart';
import '../widgets/send_message_button.dart';

class ChatDetailsScreen extends StatefulWidget {
  final UserModel user;

  const ChatDetailsScreen({super.key, required this.user});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _chatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(StreamChats(widget.user.id));
  }

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
              BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is ChatLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ChatLoaded) {
                    return _buildChatList(state.chats);
                  } else if (state is ChatError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('No Chats'));
                  }
                },
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
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.name,
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

  Widget _buildChatList(List<ChatModel> chats) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        final isSentByMe = chat.sentUserId == widget.user.id;
        return MessageCard(chat: chat, isSentByMe: isSentByMe);
      },
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
              child: GestureDetector(
                onTap: _sendMessage,
                child: const SendMessageButton(),
              ),
            )),
      ),
    );
  }

  void _sendMessage() {
    if (_chatController.text.isNotEmpty) {
      final chat = ChatEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        sentUserId: widget.user.id,
        sentUserName: widget.user.name,
        message: _chatController.text,
        timestamp: DateTime.now(),
      );

      context.read<ChatBloc>().add(AddChat(chat, widget.user.id));
      _chatController.clear();
    }
  }
}
