import 'package:sala_app/features/categories_view/data/models/category_model/datum.model.dart';

class CategoryDataModel {
  int? currentPage;
  List<CategoryDatumModel>? data;

  CategoryDataModel({
    this.currentPage,
    this.data,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CategoryDatumModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
