import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/size_config.dart';

class OnBoardingTextButton extends StatelessWidget {
  final void Function() function;

  const OnBoardingTextButton({super.key, required this.function});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: TextButton.styleFrom(
        elevation: 0,
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: (SizeConfig.width(context) <= 550) ? 14 : 17,
        ),
      ),
      child: Text('Skip'),
    );
  }
}
