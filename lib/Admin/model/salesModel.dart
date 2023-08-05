class salesModel {
  final String id;
  final String mode;
  final String date;
  final String order_id;
  final String price;
  final String productname;
  final String image;
   final String first_name;
  // final String total;



  salesModel({
    required this.id,
    required this.mode,
    required this.date,
    required this.order_id,
    required this.price,
    required this.productname,
    required this.image,
     required this.first_name,
    // required this.total,

  });

  factory salesModel.fromJson(Map<String, dynamic> json) {
    return salesModel(
      id: json['user_id'],
      mode: json['mode'],
      date: json['date'],
      order_id: json['_id'],
      price: json['price'],
      productname: json['product_name'],
       image: json['product_image'],
     first_name: json['first_name'],
      // total: json['total'],

    );
  }
}
