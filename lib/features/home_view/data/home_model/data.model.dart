import 'banner.model.dart';
import 'product.model.dart';

class DataModel {
  List<BannerModel>? banners;
  List<ProductModel>? products;
  String? ad;

  DataModel({this.banners, this.products, this.ad});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        ad: json['ad'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'banners': banners?.map((e) => e.toJson()).toList(),
        'products': products?.map((e) => e.toJson()).toList(),
        'ad': ad,
      };
}
