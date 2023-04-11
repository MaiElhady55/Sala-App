import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String? subTitl;
  final void Function()? function;

  const CustomRow({super.key, required this.title,  this.subTitl='', this.function});
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.height(context)*0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style:Styles.textStyle26 ),
              GestureDetector(
                onTap: function,
                child: Text(subTitl!,style: Styles.textStyle18))
            ],
          ),
        );
  }
}
