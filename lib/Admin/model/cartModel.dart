import 'dart:ffi';

class CartModel {
  final String productname;
 // final String category;
  final String quantity;
  final String image;
  final int total;
  final String id;
  final String status;

  CartModel({
    required this.productname,
  //  required this.category,
    required this.quantity,
    required this.image,
    required this.total,
    required this.id,
    required this.status,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productname: json['product_name'],
   //   category: json['category'],
      quantity: json['quantity'],
      image: json['product_image'],
      total: json['total'],
      id: json['_id'],
      status: json['status'],

    );
  }
}
