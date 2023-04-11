import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';
import 'package:sala_app/core/app_widgets/custom_title_appbar.dart';
import 'package:sala_app/core/functions/show_toast.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          if (state.authModel.status!) {
            showToast(
                message: state.authModel.message!, state: ToastStates.SUCCESS);
          } else {
            showToast(
                message: state.authModel.message!, state: ToastStates.ERROR);
          }
        }
      },
      builder: (context, state) {
        var model = ProfileCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: CustomTitleAppBar(
                  title: model.profileModel?.data!.name == null
                      ? 'Welcome ..👋'
                      : "Welcome ${model.profileModel?.data!.name!.split(" ").elementAt(0)} ..👋"),
              centerTitle: true,
              leading: CustomArrowBack(),
            ),
            body: ConditionalBuilder(
              condition: model.profileModel != null,
              builder: (context) => ProfileViewBody(
                profileState: state,
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}
