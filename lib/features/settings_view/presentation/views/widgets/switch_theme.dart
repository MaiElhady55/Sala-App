import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/theme_cubit/themeapp_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/theme_cubit/themeapp_state.dart';

class SwitchThemeMode extends StatelessWidget {
  const SwitchThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeappCubit, ThemeAppState>(
      listener: (context, state) {
        if (state is AppChangeModeState) {
          return print('success change Mode');
        }
      },
      builder: (context, state) {
        return CupertinoSwitch(
          value: ThemeappCubit.get(context).isDark,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {
            ThemeappCubit.get(context).changeAppMode(value);
          },
        );
      },
    );
  }
}
