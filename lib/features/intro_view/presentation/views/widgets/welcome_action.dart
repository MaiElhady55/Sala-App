import 'package:flutter/material.dart';
import 'package:sala_app/core/app_widgets/main_button.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/features/auth_view/presentation/views/login_view.dart';
import 'package:sala_app/features/auth_view/presentation/views/signup.dart';

class WelcomeAction extends StatelessWidget {
  const WelcomeAction({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          MainButton(
              width: width * 0.83,
              height: 50,
              text: 'LOGIN',
              function: () {
                navigateAndFinsh(context: context, router: LoginView());
              }),
          SizedBox(
            height: 20,
          ),
          MainButton(
            width: width * 0.83,
            //300,
            height: 50,
            text: 'SIGNUP',
            function: () => navigateAndFinsh(context: context, router: SignupView()),
            buttonColor: Colors.grey[100]!,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
