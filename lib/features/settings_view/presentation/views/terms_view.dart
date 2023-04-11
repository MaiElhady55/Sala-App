import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';
import 'package:sala_app/core/app_widgets/custom_title_appbar.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/settings_cubit/settings_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/terms_view_body.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..getSettingsData(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        builder: (context, state) {
          var cubit = SettingsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: CustomTitleAppBar(title: 'Terms and Conditions'),
              centerTitle: true,
              leading: CustomArrowBack(),
            ),
            body: ConditionalBuilder(
              condition: cubit.settingsModel != null,
              builder: (context) => TermsViewBody(),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is SettingsInitial) print('Initial State');
        },
      ),
    );
  }
}
