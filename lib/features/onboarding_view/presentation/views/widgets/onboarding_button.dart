import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';

class OnBoardingButton extends StatelessWidget {
  final String text;
  final double paddingH;
  final double paddingV;
  final void Function() functuon;

  const OnBoardingButton(
      {super.key,
      required this.text,
      required this.paddingH,
      required this.paddingV,
      required this.functuon});
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed: functuon,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding:
              EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
          textStyle: TextStyle(fontSize: (SizeConfig.width(context) <= 550) ? 13 : 17),
        ),
        child: Text(text));
  }
}
