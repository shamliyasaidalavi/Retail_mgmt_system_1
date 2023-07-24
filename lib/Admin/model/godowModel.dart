class godowModel{
  final String name;
  final String id;
  final String logid;



  godowModel({
    required this.name,
    required this.id,
    required this.logid,


  });

  factory godowModel.fromJson(Map<String, dynamic> json) {
    return godowModel(
      id: json['godow_id'],
      name: json['godown_name'],
      logid: json['logid'],
    );
  }
}