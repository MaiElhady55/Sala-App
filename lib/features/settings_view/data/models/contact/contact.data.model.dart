class ContactDataModel {
  int? id;
  int? type;
  String? value;
  String? image;

  ContactDataModel({this.id, this.type, this.value, this.image});

  factory ContactDataModel.fromJson(Map<String, dynamic> json) =>
      ContactDataModel(
        id: json['id'] as int?,
        type: json['type'] as int?,
        value: json['value'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'value': value,
        'image': image,
      };
}
