import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/lang_keys.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../../../../common/helper/validations/form_validation.dart';
import '../../../../../common/models/button_model.dart';
import '../../../../../common/widgets/custom_back_button.dart';
import '../../../../../common/widgets/rounded_button.dart';

class NewTravelScreen extends StatefulWidget {
  const NewTravelScreen({super.key});

  @override
  State<NewTravelScreen> createState() => _NewTravelScreenState();
}

class _NewTravelScreenState extends State<NewTravelScreen> {
  final TextEditingController _travelTitleController = TextEditingController();
  final TextEditingController _travelDescController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _personsController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                    text: LangKeys.addTravel,
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
            title: LangKeys.submit,
            onPress: () {
              // Handle the submit action
            },
          ),
        ),
      ),
    );
  }
}
