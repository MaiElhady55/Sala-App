import 'package:flutter/material.dart';
import 'package:sala_app/core/app_widgets/custom_textformfield.dart';
import 'package:sala_app/core/app_widgets/main_button.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/show_logout_dialog.dart';

class ProfileViewBody extends StatelessWidget {
  final ProfileState profileState;
  ProfileViewBody({
    super.key,
    required this.profileState,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height(context);
    var model = ProfileCubit.get(context);
    nameController.text = model.profileModel!.data!.name!;
    emailController.text = model.profileModel!.data!.email!;
    phoneController.text = model.profileModel!.data!.phone!;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              if (profileState is UpdateProfileLoadingStates)
                LinearProgressIndicator(),
              SizedBox(
                height: height * 0.060,
              ),
              CustomTextFormField(
                  controller: nameController,
                  lableText: 'Name',
                  prifix: Icon(
                    Icons.person,
                    color: AppColors.kPrimaryColor,
                  ),
                  type: TextInputType.text,
                  style: Theme.of(context).textTheme.bodyText2!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some Text';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * 0.027,
              ),
              CustomTextFormField(
                  controller: emailController,
                  lableText: 'Email Adress',
                  prifix: Icon(
                    Icons.email,
                    color: AppColors.kPrimaryColor,
                  ),
                  type: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.bodyText2!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some Text';
                    }
                    if (!value.contains('@')) {
                      return 'Please Enter valid Email';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * 0.027,
              ),
              CustomTextFormField(
                  controller: phoneController,
                  lableText: 'Phone',
                  prifix: Icon(
                    Icons.phone,
                    color: AppColors.kPrimaryColor,
                  ),
                  type: TextInputType.phone,
                  style: Theme.of(context).textTheme.bodyText2!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some Text';
                    }
                    if (value.length <= 10) {
                      return 'Please Enter right number';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * 0.055,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButton(
                      width: 140,
                      height: 50,
                      text: 'LogOut',
                      function: () {
                        showLogOutDialog(context);
                      }),
                  MainButton(
                      width: 140,
                      height: 50,
                      text: 'Update',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          model.updateProfile(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text);
                        }
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
