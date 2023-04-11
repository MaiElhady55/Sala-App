import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sala_app/core/utils/app_colors.dart';

class CustomArrow extends StatelessWidget {
 

  const CustomArrow({super.key,});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.navigate_next,
      color: AppColors.kPrimaryColor,
      size: 30,
    );
  }
}
