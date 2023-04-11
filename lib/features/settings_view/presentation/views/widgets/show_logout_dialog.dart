import 'package:flutter/material.dart';
import 'package:sala_app/core/app_widgets/main_text_button.dart';
import 'package:sala_app/core/functions/sign_out.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/styles.dart';

void showLogOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Log out ? ', style: Styles.textStyle18W),
        content: Text('Do You sure to log out ?', style: Styles.textStyle18W),
        actions: [
          MainTextButton(
            text: 'Cancel',
            function: () => Navigator.pop(context),
            textStyle: Styles.textStyle18W,
          ),
          MainTextButton(
            text: 'Log out',
            function: () => signOut(context),
            textStyle: Styles.textStyle18W,
          ),
        ],
        elevation: 24,
        backgroundColor: AppColors.kPrimaryColor,
      );
    },
  );
}
