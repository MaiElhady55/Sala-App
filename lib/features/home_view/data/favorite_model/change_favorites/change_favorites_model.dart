class ChangeIconeFavoriteModel {
  final bool status;
  final String message;

  ChangeIconeFavoriteModel({required this.status, required this.message});

  factory ChangeIconeFavoriteModel.fromJson(Map<String, dynamic> json) {
    return ChangeIconeFavoriteModel(
        status: json['status'], message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
