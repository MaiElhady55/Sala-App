import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/settings_cubit/settings_cubit.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsCubit = SettingsCubit.get(context);
    var width = SizeConfig.width(context);
    var height = SizeConfig.height(context);
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding:
                EdgeInsets.only(top: height * 0.028, bottom: height * 0.060),
            child: Center(
                child: Image.asset(
              AppImages.logo,
              width: width * 0.50, //202,
              height: height * 0.24, //177
            )),
          ),
          Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.grey[200]!.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16, left: 8, bottom: height / 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      settingsCubit.settingsModel!.data!.about!,
                      style: Styles.textStyle18.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ))
        ]));
  }
}
