import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';

abstract class Styles {
  static TextStyle textStyle40 = TextStyle(
      fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black54);

  static TextStyle textStyle30 = TextStyle(
      fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600);

  static TextStyle textStyle14 = TextStyle(
      fontSize: 14, color: Color(0xFF8D8E98), fontWeight: FontWeight.w300);

  static TextStyle textStyle14white =
      TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w900);

  static TextStyle textStyle24 = TextStyle(
      fontFamily: 'Pacifico', color: AppColors.kPrimaryColor, fontSize: 24);

  static TextStyle textStyle26 = TextStyle(
      color: AppColors.kPrimaryColor,
      fontSize: 26,
      fontWeight: FontWeight.bold);

  static TextStyle textStyle18 =
      TextStyle(color: AppColors.kPrimaryColor, fontSize: 18);

  static TextStyle textStyle18W = TextStyle(color: Colors.white, fontSize: 18);

  static TextStyle textStyle15 = TextStyle(fontSize: 15, color: Colors.black);

  static TextStyle textStyle22 =
      TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w900);

  static TextStyle textStyle12 = TextStyle(
      color: Colors.grey, fontSize: 12, decoration: TextDecoration.lineThrough);

  static TextStyle textStyle16 =
      TextStyle(fontSize: 16.0, height: 1.3, color: Colors.grey[500]);

  static TextStyle textStyle20 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: 20.0,
    height: 1.2,
    fontWeight: FontWeight.w900,
  );
}
