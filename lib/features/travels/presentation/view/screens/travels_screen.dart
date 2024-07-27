import 'package:bevatel_task/common/constants/lang_keys.dart';
import 'package:bevatel_task/common/helper/navigation/navigation.dart';
import 'package:bevatel_task/common/helper/navigation/routes.dart';
import 'package:bevatel_task/common/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../viewmodel/travels_bloc.dart';
import '../../viewmodel/travels_event.dart';
import '../../viewmodel/travels_state.dart';
import '../widgets/travel_item.dart';

class TravelsScreen extends StatefulWidget {
  const TravelsScreen({super.key});

  @override
  State<TravelsScreen> createState() => _TravelsScreenState();
}

class _TravelsScreenState extends State<TravelsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TravelBloc>().add(LoadTravels());
  }

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
        child: BlocBuilder<TravelBloc, TravelState>(
          builder: (context, state) {
            if (state is TravelLoading) {
              return const Center(child: Loader());
            } else if (state is TravelLoaded) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: state.travels.length,
                itemBuilder: (context, index) {
                  final travel = state.travels[index];
                  return TravelItem(travel: travel);
                },
              );
            } else if (state is TravelError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No travels found'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigation().navigateTo(routeName: AppRoutes.addEditTravelScreen);
        },
        child: const Icon(Icons.add),backgroundColor: AppColors.primary,
      ),
    );
  }
}
