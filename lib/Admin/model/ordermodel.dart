import 'dart:ffi';

class orderModel {
//  final String productname;
  // final String category;
  final String quantity;
  final String image;
  final int total;
  final String id;
  final String user_name;
  final String date;
//  final String status;

  orderModel({
 //   required this.productname,
    //  required this.category,
    required this.quantity,
    required this.image,
    required this.total,
    required this.id,
    required this.user_name,
    required this.date,
   // required this.status,
  });

  factory orderModel.fromJson(Map<String, dynamic> json) {
    return orderModel(
   //   productname: json['product_name'],
      //   category: json['category'],
      quantity: json['quantity'],
      image: json['product_image'],
      total: json['price'],
      id: json['_id'],
      user_name: json['user_name'],
      date: json['date'],
    //  status: json['status'],

    );
  }
}
