import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/bottom_nav_views/presentation/views/bottom_nav_view.dart';
import 'package:sala_app/features/intro_view/presentation/views/welcome_view.dart';
import 'package:sala_app/features/onboarding_view/presentation/views/onboarding_view.dart';

class SplashView extends StatelessWidget {

  const SplashView({super.key});

  
  @override
  Widget build(BuildContext context) {
    Widget startWidget;

  if (onBoarding != null) {
    if (token != null) {
      startWidget = BottomNavView();
    } else {
      startWidget = WelcomeView();
    }
  } else {
    startWidget = OnBoardingView();
  }

  
    return EasySplashScreen(
      logo: Image.asset(AppImages.logo),
      logoWidth: 73,
      showLoader: false,
      durationInSeconds: 2,
      navigator: startWidget,
      title: Text(
        'Sala App',
        style: Styles.textStyle40,
      ),
    );
  }
}
