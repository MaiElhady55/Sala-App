part of 'categoies_details_cubit.dart';

@immutable
abstract class CategoiesDetailsState {}

class CategoiesDetailsInitial extends CategoiesDetailsState {}

class CategoiesDetailsLoading extends CategoiesDetailsState {}

class CategoiesDetailsSuccess extends CategoiesDetailsState {}

class CategoiesDetailsFailure extends CategoiesDetailsState {
  final String errMessage;

  CategoiesDetailsFailure(this.errMessage);
}
