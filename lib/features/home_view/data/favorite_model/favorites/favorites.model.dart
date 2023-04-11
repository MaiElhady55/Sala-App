import 'data.model.dart';

class FavoritesModel {
  bool? status;
  dynamic message;
  Data? data;

  FavoritesModel({this.status, this.message, this.data});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
