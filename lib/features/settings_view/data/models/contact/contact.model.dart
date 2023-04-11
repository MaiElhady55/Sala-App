import 'data.model.dart';

class ContactModel {
  bool? status;
  dynamic message;
  Data? data;

  ContactModel({this.status, this.message, this.data});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
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
