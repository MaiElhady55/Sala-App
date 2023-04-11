import 'data.model.dart';

class SettingsModel {
  bool? status;
  dynamic message;
  Data? data;

  SettingsModel({this.status, this.message, this.data});

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
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
