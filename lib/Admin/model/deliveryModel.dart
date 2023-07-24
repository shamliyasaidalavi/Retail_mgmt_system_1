class deliveryModel{
  final String delboyname;
  final String id;
  final String logid;



  deliveryModel({required this.delboyname,
    required this.id,
    required this.logid,

  });

  factory deliveryModel.fromJson(Map<String, dynamic> json) {
    return deliveryModel(
      id: json['_id'],
      delboyname: json['deliveryboy_name'],
      logid: json['logid'],
    );
  }
}