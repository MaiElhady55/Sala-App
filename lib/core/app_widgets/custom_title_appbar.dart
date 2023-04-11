import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/styles.dart';

class CustomTitleAppBar extends StatelessWidget {
  final String title;

  const CustomTitleAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Styles.textStyle22);
  }
}
