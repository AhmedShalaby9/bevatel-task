import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/image_paths.dart';
import '../../../../../common/constants/lang_keys.dart';
import '../../../../../common/constants/text_themes.dart';
import '../../../../../common/helper/navigation/navigation.dart';
import '../../../../../common/helper/navigation/routes.dart';
import '../../../../../common/helper/validations/form_validation.dart';
import '../../../../../common/models/button_model.dart';
import '../../../../../common/widgets/rounded_button.dart';
import '../../viewmodel/bloc/auth_bloc.dart';
import '../../viewmodel/bloc/auth_event.dart';
import '../../viewmodel/bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(ImagePaths.loginImage, width: 408.w, height: 175.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                child: Form(
                  key: loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      _buildLoginTitles(),
                      SizedBox(height: 44.h),
                      _buildEmailTextField(),
                      SizedBox(height: 15.h),
                      _buildPasswordTextField(),
                      SizedBox(height: 30.h),
                      _buildLoginButton(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildLoginTitles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: LangKeys.loginTitle.toString().substring(0, 6),
            style: TextThemes.style25500.copyWith(color: AppColors.backGround),
            children: <TextSpan>[
              TextSpan(
                  text: LangKeys.loginTitle.substring(6, 13),
                  style: TextThemes.style25800
                      .copyWith(color: AppColors.backGround))
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          LangKeys.loginSubTitle,
          style: TextThemes.style12400.copyWith(color: AppColors.greyMedium),
        ),
      ],
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

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: visible,
      decoration: InputDecoration(
          hintText: LangKeys.password,
          suffixIcon: GestureDetector(
              onTap: () {
                visible = !visible;
                setState(() {});
              },
              child: Icon(visible ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primary))),
      validator: (value) {
        return FormValidation.getPasswordErrorMessage(value!);
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedIn) {
            Navigation().navigateAndRemoveUntil(routeName: AppRoutes.travelsScreen);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return RoundedButton(
            model: ButtonModel(
              isLoading: state is AuthLoading,
              onPress: () {
                if (loginKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                      LoginUser(_emailController.text, _passwordController.text));
                }
              },
              title: LangKeys.login,
              textColor: AppColors.black,
            ),

          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LangKeys.dontHaveAccount.substring(0, 23),
              style:
              TextThemes.style12400.copyWith(color: AppColors.greyMedium),
            ),
            GestureDetector(
              onTap: () {
                Navigation().navigateTo(routeName: AppRoutes.signupScreen);
              },
              child: Text(
                LangKeys.dontHaveAccount.substring(23, 31),
                style: TextThemes.style12700.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
