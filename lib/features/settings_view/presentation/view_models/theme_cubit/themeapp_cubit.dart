import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/core/network/local/cache_helper.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/theme_cubit/themeapp_state.dart';

class ThemeappCubit extends Cubit<ThemeAppState> {
  ThemeappCubit() : super(ThemeAppInitialState());

  static ThemeappCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode([bool? modeFromShared]) {
    if (modeFromShared != null) {
      isDark = modeFromShared;
      emit(AppChangeModeState());
    } else {
     // isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: modeFromShared!)
          .then((value) => emit(AppChangeModeState()));
    }
  }
}
