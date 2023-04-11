import 'cart_item.model.dart';

class CartDataModel {
  List<CartItem>? cartItems;
  dynamic subTotal;
  dynamic total;

  CartDataModel({this.cartItems, this.subTotal, this.total});

  factory CartDataModel.fromJson(Map<String, dynamic> json) => CartDataModel(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: json['sub_total'] as num?,
        total: json['total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'cart_items': cartItems?.map((e) => e.toJson()).toList(),
        'sub_total': subTotal,
        'total': total,
      };
}
