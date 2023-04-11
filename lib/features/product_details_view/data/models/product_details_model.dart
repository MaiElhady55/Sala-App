class ProductDetailsmodel {
  final bool status;
  final Data? data;

  ProductDetailsmodel({required this.status, required this.data});

  factory ProductDetailsmodel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsmodel(
        status: json['status'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }
}

class Data {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Data(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
      required this.images,
      required this.inFavorites,
      required this.inCart});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
        images: json['images'].cast<String>(),
        inFavorites: json['in_favorites'],
        inCart: json['in_cart']);
  }
}
