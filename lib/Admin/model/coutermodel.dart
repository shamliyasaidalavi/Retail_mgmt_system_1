class couterModel{
  final String countername;
  final String id;
//  final String countername;


  couterModel({required this.countername,
    required this.id,

    // required this.countername,
  });

  factory couterModel.fromJson(Map<String, dynamic> json) {
    return couterModel(
      id: json['logid'],
      countername: json['counter_name'],
    );
  }
}