class CategoryDatumModel {
  int? id;
  String? name;
  String? image;

  CategoryDatumModel({this.id, this.name, this.image});

  factory CategoryDatumModel.fromJson(Map<String, dynamic> json) =>
      CategoryDatumModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
