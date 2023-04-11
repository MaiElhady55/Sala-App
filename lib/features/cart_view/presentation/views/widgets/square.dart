

import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';

class Square extends StatelessWidget {
  const Square({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height:50,
      decoration: BoxDecoration(
      color:AppColors.kPrimaryColor,
  ),
    );
  }
}

