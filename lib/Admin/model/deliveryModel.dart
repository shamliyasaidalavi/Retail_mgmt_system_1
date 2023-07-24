class deliveryModel{
  final String username;
  final String delboyname;

  final String order_id;

  final String id;
  final String logid;
  final String address;
  final String phone_no;
  final String time;
  



  deliveryModel({required this.username,
    required this.id,
    required this.order_id,
    required this.logid,
    required this.address,
    required this.phone_no,
    required this.time,
    required this.delboyname,

  });

  factory deliveryModel.fromJson(Map<String, dynamic> json) {
    return deliveryModel(
      id: json['_id'],
      username: json['user_name'],
      address: json['address'],
      phone_no: json['phone_no'],
      order_id: json['order_id'],
      time: json['time'],
      logid: json['logid'],
      delboyname: json['delboyname'],
    );
  }
}