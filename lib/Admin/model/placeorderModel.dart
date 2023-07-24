import 'dart:ffi';

class placeorderModel {
  final String productname;
  // final String category;
  final String quantity;
  final String image;
  final int total;
  final String id;
  final String totalValue;

  placeorderModel({
    required this.productname,
    //  required this.category,
    required this.quantity,
    required this.image,
    required this.total,
    required this.id,
    required this.totalValue,
  });

  factory placeorderModel.fromJson(Map<String, dynamic> json) {
    return placeorderModel(
      productname: json['product_name'],
      //   category: json['category'],
      quantity: json['quantity'],
      image: json['product_image'],
      total: json['price'],
      totalValue: json['total_amount'],
      id: json['_id'],

    );
  }
}
//