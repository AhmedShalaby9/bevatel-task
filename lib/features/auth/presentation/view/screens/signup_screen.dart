import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/lang_keys.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../../../../common/helper/validations/form_validation.dart';

import '../../../../../common/models/button_model.dart';
import '../../../../../common/widgets/custom_back_button.dart';
import '../../../../../common/widgets/rounded_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomBackButton(),
            SizedBox(height: 50.h),
            RichText(
              text: TextSpan(
                text: LangKeys.registerTitle,
                style:
                    TextThemes.style25500.copyWith(color: AppColors.backGround),
                children: <TextSpan>[
                  const TextSpan(text: " "),
                  TextSpan(
                      text: LangKeys.account,
                      style: TextThemes.style25800
                          .copyWith(color: AppColors.backGround))
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              LangKeys.loginSubTitle,
              style:
                  TextThemes.style12400.copyWith(color: AppColors.greyMedium),
            ),
             SizedBox(height: 24.h),
            _buildFullNameTextField(),
            SizedBox(height: 15.h),
            _buildEmailTextField(),
            SizedBox(height: 15.h),
            _buildPhoneTextField(),
            SizedBox(height: 15.h),
            _buildCountryTextField(),
            SizedBox(height: 15.h),
            _buildPasswordTextField(),
            SizedBox(height: 15.h),
            _buildConfirmPasswordTextField()
          ]),
        ),
      )),
    );
  }

  Widget _buildFullNameTextField() {
    return TextFormField(
      controller: _fullNameController,
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.fullName),
      validator: (value) {
        return FormValidation.getNameErrorMessage(value!);
      },
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.email),
      validator: (value) {
        return FormValidation.getEmailErrorMessage(value!);
      },
    );
  }

  Widget _buildPhoneTextField() {
    return TextFormField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.phoneNumber),
      validator: (value) {
        return FormValidation.getRequiredFieldErrorMessage(value!);
      },
    );
  }

  Widget _buildCountryTextField() {
    return TextFormField(
      controller: _countryController,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: LangKeys.country),
      validator: (value) {
        return FormValidation.getRequiredFieldErrorMessage(value!);
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: passwordVisible,
      decoration: InputDecoration(
          hintText: LangKeys.password,
          suffixIcon: GestureDetector(
              onTap: () {
                passwordVisible = !passwordVisible;
                setState(() {});
              },
              child: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primary))),
      validator: (value) {
        return FormValidation.getPasswordErrorMessage(value!);
      },
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      controller: _confirmPasswordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: confirmPasswordVisible,
      decoration: InputDecoration(
          hintText: LangKeys.confirmPass,
          suffixIcon: GestureDetector(
              onTap: () {
                confirmPasswordVisible = !confirmPasswordVisible;
                setState(() {});
              },
              child: Icon(
                  confirmPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.primary))),
      validator: (value) {
        return FormValidation.getPasswordMatchingErrorMessage(
            value!, _passwordController.text);
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
              title: LangKeys.register,
              onPress: () {
                //  Navigation().navigateTo(routeName: AppRoutes.navigationScreen);
              }),
        ),
      ),
    );
  }
}
