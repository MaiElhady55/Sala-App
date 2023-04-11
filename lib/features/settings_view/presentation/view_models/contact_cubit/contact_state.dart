part of 'contact_cubit.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {}

class ContactFailure extends ContactState {
  final String errMessage;

  ContactFailure(this.errMessage);
}
