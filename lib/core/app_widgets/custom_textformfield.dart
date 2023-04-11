import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String lableText;
  final String? hintText;
  final Widget prifix;
  final TextInputType type;
  final TextStyle style;
  final FormFieldValidator validator;
  final bool? obscureText;
  final IconData? suffixIcon;
  final VoidCallback? suffixFun;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.lableText,
       this.hintText,
      required this.prifix,
      required this.type,
      required this.style,
      required this.validator,
      this.obscureText = false,
      this.suffixIcon = null,
      this.suffixFun = null});
  /*
 final TextEditingController controller;
  final String lableText;
  final String hintText;
  final Widget prifix;
  final TextInputType type;
  final TextStyle style;
  final FormFieldValidator validator;
  final bool? obscureText;
  final IconData? suffixIcon;
  final VoidCallback? suffixFun;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmited;

  const DefaultTextFormField(
      {super.key,
      required this.controller,
      required this.lableText,
      required this.hintText,
      required this.prifix,
      this.suffixIcon,
      required this.type,
      required this.style,
      required this.validator,
      this.obscureText,
      this.suffixFun,
      this.onTap,
      this.onChanged,
      this.onSubmited});*/

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: style,
        validator: validator,
        controller: controller,
        autocorrect: false,
        keyboardType: type,
        obscureText: obscureText!,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(25.0),
          ),
          border: OutlineInputBorder(),
          labelText: lableText,
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF8D8E98)),
          labelStyle: TextStyle(color: AppColors.kPrimaryColor),
          prefixIcon: prifix,
          suffixIcon: IconButton(
              icon: Icon(suffixIcon, color: AppColors.kPrimaryColor),
              onPressed: suffixFun),
        ));

    /* TextFormField(
        style: style,
        validator: validator,
        controller: controller,
        keyboardType: type,
        obscureText: obscureText!,
        onChanged: onChanged,
        onFieldSubmitted: onSubmited,
        onTap: onTap,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.MAIN),
            borderRadius: BorderRadius.circular(25.0),
          ),
          border: OutlineInputBorder(),
          labelText: lableText,
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF8D8E98)),
          labelStyle: TextStyle(color: AppColors.MAIN),
          prefixIcon: prifix,
          suffixIcon: IconButton(
              icon: Icon(suffixIcon, color: AppColors.MAIN),
              onPressed: suffixFun),
        ));*/
  }
}
