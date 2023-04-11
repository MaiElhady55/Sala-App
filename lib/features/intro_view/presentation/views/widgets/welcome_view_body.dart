import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/intro_view/presentation/views/widgets/welcome_action.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.logo,
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Shopping Now',
            style: Styles.textStyle30,
          ),
          Text('Welcome to Application', style: Styles.textStyle14),
          const SizedBox(
            height: 30,
          ),
          WelcomeAction(),
        ],
      ),
    );
  }
}
