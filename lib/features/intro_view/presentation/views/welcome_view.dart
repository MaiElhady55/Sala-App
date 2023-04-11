import 'package:flutter/material.dart';
import 'package:sala_app/features/intro_view/presentation/views/widgets/welcome_view_body.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeViewBody(),
    );
  }
}
