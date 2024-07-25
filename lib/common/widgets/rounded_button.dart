import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/text_themes.dart';
import '../models/button_model.dart';
import 'loader.dart';

class RoundedButton extends StatelessWidget {
  final ButtonModel model;

  const RoundedButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.onPress,
      child: Container(
        height: model.height ?? 60,
        width: model.width ?? double.infinity,
        decoration: BoxDecoration(
            color: model.color ?? AppColors.primary,
            border: Border.all(
              color: model.borderColor ?? AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(model.radius ?? 10)),
        child: Center(
          child: model.isLoading
              ? const Loader(
                  color: AppColors.white,
                )
              : Text(
                  model.title ?? "",
                  style: model.textStyle ??
                      TextThemes.style16700.copyWith(
                        color: model.textColor,
                      ),
                ),
        ),
      ),
    );
  }
}
