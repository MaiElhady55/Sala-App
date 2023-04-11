import 'category_data.model.dart';

class CategoryModel {
  bool? status;
  CategoryDataModel? data;

  CategoryModel({this.status, this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json['status'] as bool?,
        data: json['data'] == null
            ? null
            : CategoryDataModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
