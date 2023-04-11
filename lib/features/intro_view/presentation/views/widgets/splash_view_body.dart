import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.logo,
          width: 150,
          height: 140,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Sala App',
          style: Styles.textStyle40,
        ),
      ],
    );
  }
}
