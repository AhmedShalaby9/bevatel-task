import 'package:bevatel_task/common/constants/lang_keys.dart';
import 'package:bevatel_task/common/helper/navigation/navigation.dart';
import 'package:bevatel_task/common/helper/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_colors.dart';
import '../widgets/travel_item.dart';

class TravelsScreen extends StatefulWidget {
  const TravelsScreen({super.key});

  @override
  State<TravelsScreen> createState() => _TravelsScreenState();
}

class _TravelsScreenState extends State<TravelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: [Text(LangKeys.chats)],
        automaticallyImplyLeading: false,
        title: Text(LangKeys.travels),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.h);
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return TravelItem();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigation().navigateTo(routeName: AppRoutes.addNewTravel);
        },
      ),
    );
  }
}
