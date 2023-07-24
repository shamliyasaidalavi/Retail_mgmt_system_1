class UserModel{
  final String fname;
  final String lid;
  final String id;
  final String lname;
  final String logid;

//  final String countername;


  UserModel({required this.fname,
    required this.id,
    required this.lname,
    required this.lid,
    required this.logid,
   // required this.countername,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['_id'],
        fname: json['first_name'],
        lname: json['last_name'],
        lid: json['id'],
      logid: json['logid'],
    //  countername: json['counter_name']
        );
    }
}