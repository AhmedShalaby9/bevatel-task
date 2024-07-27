import 'package:bevatel_task/common/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/lang_keys.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../viewmodel/chat_bloc.dart';
import '../../viewmodel/chat_events.dart';
import '../../viewmodel/chat_state.dart';
import '../widgets/chat_card_item.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(LoadChats());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              _buildSearchTextField(),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    if (state is ChatLoading) {
                      return const Center(child: Loader());
                    } else if (state is ChatLoaded) {
                      return ListView.builder(
                        itemCount: state.chats.length,
                        itemBuilder: (context, index) {
                          final chat = state.chats[index];
                          return ChatCardItem(chat: chat);
                        },
                      );
                    } else if (state is ChatError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(child: Text('No Chats'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        LangKeys.chat,
        style: TextThemes.style14700.copyWith(color: AppColors.backGround),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Card(
      elevation: 2,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none),
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
            fillColor: AppColors.white,
            hintText: LangKeys.search,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none),
            prefixIcon: const Icon(Icons.search, color: AppColors.backGround)),
        onChanged: (value) {
          // Handle the search logic here
          // You can use the search value to filter the list of chats
        },
      ),
    );
  }
}
