import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/styles.dart';

class CustomRowAppBar extends StatelessWidget {
  const CustomRowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(
            AppImages.logo,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text('Salaa ', style: Styles.textStyle24),
      ],
    );
  }
}
