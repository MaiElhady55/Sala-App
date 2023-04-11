import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';

class MainButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final double fontsize;
  final VoidCallback function;

  const MainButton(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      this.fontsize=20,
      this.borderRadius = 25.0,
      this.buttonColor = AppColors.kPrimaryColor,
      this.textColor = Colors.white,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor,
            foregroundColor: textColor,
            textStyle: TextStyle(
                fontSize: fontsize, fontWeight: FontWeight.w900, letterSpacing: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: Text(text),
      ),
    );
  }
}
