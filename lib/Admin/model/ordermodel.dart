import 'dart:ffi';

class OrderModel {
//  final String productname;
  // final String category;
  final String quantity;
  final String image;
  final int total;
  final String id;
//  final String status;

  OrderModel({
 //   required this.productname,
    //  required this.category,
    required this.quantity,
    required this.image,
    required this.total,
    required this.id,
   // required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
   //   productname: json['product_name'],
      //   category: json['category'],
      quantity: json['quantity'],
      image: json['product_image'],
      total: json['price'],
      id: json['_id'],
    //  status: json['status'],

    );
  }
}
