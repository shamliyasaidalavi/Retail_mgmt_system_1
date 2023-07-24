import 'dart:ffi';

class offerModel {
  final String product_name;

  final String id;
  final String image;
  final String offer_name;


  offerModel({
    required this.product_name,

    required this.id,
    required this.offer_name,
    required this.image,

  });

  factory offerModel.fromJson(Map<String, dynamic> json) {
    return offerModel(

      //   category: json['category'],
     product_name: json['product_name'],
      id: json['_id'],
      image: json['product_image'],
      offer_name: json['offer_name'],


    );
  }
}
//