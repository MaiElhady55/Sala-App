import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';

class CustomRowMaterialButton extends StatelessWidget {
  final IconData icon;
  final void Function() fun;

  const CustomRowMaterialButton({super.key, required this.icon, required this.fun});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: fun,
      elevation: 2.0,
      shape: CircleBorder(),
      fillColor: AppColors.kPrimaryColor,
      child: Icon(
        icon,
        color: Colors.white,
        size: 20.0,
      ),
      constraints: BoxConstraints.tightFor(
        width: 37.0,
        height: 37.0,
      ),
    );
  }
}
