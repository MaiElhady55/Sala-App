import 'categories_data.details.model.dart';

class CategoriesDetailsModel {
  bool? status;
  CategoriesDataDetailsModel? data;

  CategoriesDetailsModel({this.status, this.data});

  factory CategoriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDetailsModel(
        status: json['status'] as bool?,
        data: json['data'] == null
            ? null
            : CategoriesDataDetailsModel.fromJson(
                json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
