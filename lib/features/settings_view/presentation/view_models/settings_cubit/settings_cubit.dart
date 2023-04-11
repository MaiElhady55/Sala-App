import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/network/end_point/end_point.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/settings_view/data/models/settings/settings.model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);

  SettingsModel? settingsModel;

  Future<void> getSettingsData() async {
    emit(SettingsLoading());
    try {
      Response response =
          await DioHelper.getData(endPoint: SETTINGS, token: token);
      settingsModel = SettingsModel.fromJson(response.data);
      emit(SettingsSuccess());
    } catch (e) {
      print(e.toString());
      emit(SettingsFailure(e.toString()));
    }
  }
}
