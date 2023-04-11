import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/onboarding_view/data/onboarding_model.dart';

class OnBoardintItem extends StatelessWidget {
  final OnBoardingModel boarding;

  const OnBoardintItem({super.key, required this.boarding});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              boarding.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            boarding.title,
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            boarding.description,
            style: Styles.textStyle14.copyWith(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
