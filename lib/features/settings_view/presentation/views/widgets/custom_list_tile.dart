import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/styles.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final double height;
  final void Function()? fun;
  final Widget trailingWidget;
  final int count;
  final Color borderColor;
  final Image? widget;

  const CustomListTile(
      {super.key,
      required this.title,
      this.height = 60,
      this.count = 0,
     required this.borderColor,
      this.widget,
      this.leadingIcon,
      required this.trailingWidget,
      this.fun});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey[200]!)),
          child: ListTile(
              contentPadding: EdgeInsets.only(right: 6, left: 10),
              leading: count == 0
                  ? Icon(
                      leadingIcon,
                      color: AppColors.kPrimaryColor,
                      size: 40,
                    )
                  : widget,
              title: Text(title,
                  style: Styles.textStyle18.copyWith(color: Colors.black)),
              trailing: trailingWidget)),
    );
  }
}
