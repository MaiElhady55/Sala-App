import 'product.model.dart';

class FavoritesData {
  int? id;
  Product? product;

  FavoritesData({this.id, this.product});

  factory FavoritesData.fromJson(Map<String, dynamic> json) => FavoritesData(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };
}
