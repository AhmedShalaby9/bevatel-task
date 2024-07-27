import 'package:bevatel_task/common/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/lang_keys.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../../../../common/helper/validations/form_validation.dart';
import '../../../../../common/models/button_model.dart';
import '../../../../../common/widgets/custom_back_button.dart';
import '../../../../../common/widgets/rounded_button.dart';
import '../../../domain/model/travel_model.dart';
import '../../viewmodel/travels_bloc.dart';
import '../../viewmodel/travels_event.dart';
import '../../viewmodel/travels_state.dart';

class AddEditTravelScreen extends StatefulWidget {
  final TravelModel? travel;

  const AddEditTravelScreen({super.key, this.travel});

  @override
  State<AddEditTravelScreen> createState() => _AddEditTravelScreenState();
}

class _AddEditTravelScreenState extends State<AddEditTravelScreen> {
  final TextEditingController _travelTitleController = TextEditingController();
  final TextEditingController _travelDescController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _personsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.travel != null) {
      _travelTitleController.text = widget.travel!.title;
      _travelDescController.text = widget.travel!.description;
      _fromController.text = widget.travel!.from;
      _toController.text = widget.travel!.to;
      _personsController.text = widget.travel!.numberOfPersons.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildNavBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 22.w, left: 22.w, top: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                SizedBox(height: 50.h),
                RichText(
                  text: TextSpan(
                    text: widget.travel == null
                        ? LangKeys.addTravel
                        : LangKeys.editTravel,
                    style: TextThemes.style25500
                        .copyWith(color: AppColors.backGround),
                  ),
                ),
                SizedBox(height: 30.h),
                _buildTravelTitleTextField(),
                SizedBox(height: 15.h),
                _buildTravelDescTextField(),
                SizedBox(height: 15.h),
                _buildFromTextField(),
                SizedBox(height: 15.h),
                _buildToTextField(),
                SizedBox(height: 15.h),
                _buildPersonsTextField(),
                BlocConsumer<TravelBloc, TravelState>(
                  listener: (context, state) {
                    if (state is TravelAdded || state is TravelUpdated) {
                      Navigator.of(context).pop();
                    }
                  },
                  builder: (context, state) {
                    if (state is TravelAdding || state is TravelUpdating) {
                      return const Center(child: Loader());
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTravelTitleTextField() {
    return TextFormField(
      controller: _travelTitleController,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.travelTitle),
      validator: (value) {
        return FormValidation.getRequiredFieldErrorMessage(value!);
      },
    );
  }

  Widget _buildTravelDescTextField() {
    return TextFormField(
      controller: _travelDescController,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.travelDesc),
      validator: (value) {
        return FormValidation.getRequiredFieldErrorMessage(value!);
      },
    );
  }

  Widget _buildFromTextField() {
    return TextFormField(
      controller: _fromController,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.from),
      validator: (value) {
        return FormValidation.getRequiredFieldErrorMessage(value!);
      },
    );
  }

  Widget _buildToTextField() {
    return TextFormField(
      controller: _toController,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.to),
      validator: (value) {
        return FormValidation.getRequiredFieldErrorMessage(value!);
      },
    );
  }

  Widget _buildPersonsTextField() {
    return TextFormField(
      controller: _personsController,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.numberOfPersons),
      validator: (value) {
        return FormValidation.getRequiredFieldErrorMessage(value!);
      },
    );
  }

  Widget _buildNavBar() {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(right: 38.w, left: 38.w, bottom: 30.h, top: 38.h),
        child: RoundedButton(
          model: ButtonModel(
            title: widget.travel == null ? LangKeys.submit : LangKeys.update,
            onPress: () {
              if (_validateForm()) {
                final travel = TravelModel(
                  id: widget.travel?.id ??
                      DateTime.now().millisecondsSinceEpoch.toString(),
                  title: _travelTitleController.text,
                  description: _travelDescController.text,
                  from: _fromController.text,
                  to: _toController.text,
                  numberOfPersons: int.parse(_personsController.text),
                );

                if (widget.travel == null) {
                  context.read<TravelBloc>().add(AddTravel(travel));
                } else {
                  context.read<TravelBloc>().add(UpdateTravel(travel));
                }
              }
            },
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    return _travelTitleController.text.isNotEmpty &&
        _travelDescController.text.isNotEmpty &&
        _fromController.text.isNotEmpty &&
        _toController.text.isNotEmpty &&
        _personsController.text.isNotEmpty;
  }
}
