class ChangeCartsModel {
  final bool status;
  final String message;
  ChangeCartsModel({required this.status, required this.message});

  factory ChangeCartsModel.fromJson(Map<String, dynamic> json) {
    return ChangeCartsModel(status: json['status'], message: json['message']);
  }
}
