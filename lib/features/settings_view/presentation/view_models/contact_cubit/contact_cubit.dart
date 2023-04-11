import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/network/end_point/end_point.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/settings_view/data/models/contact/contact.model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());
  static ContactCubit get(context) => BlocProvider.of(context);

  ContactModel? contactModel;

  Future<void> getContactData() async {
    emit(ContactLoading());
    try {
      Response response =
          await DioHelper.getData(endPoint: CONTACT, token: token);
      contactModel = ContactModel.fromJson(response.data);
      emit(ContactSuccess());
    } catch (e) {
      print(e.toString());
      emit(ContactFailure(e.toString()));
    }
  }
}
