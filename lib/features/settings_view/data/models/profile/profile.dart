import 'data.dart';

class Profile {
  bool? status;
  dynamic message;
  Data? data;

  Profile({this.status, this.message, this.data});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
