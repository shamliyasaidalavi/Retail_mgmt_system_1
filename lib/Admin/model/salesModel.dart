class salesModel {
  final String bill_number;
  final String id;
  final String Username;
  final String Amount;
  final String Amounttype;
  final String Date;

  final String totalValue;


  salesModel({
    required this. bill_number,
    required this.id,
    required this.Username,
    required this.Amount,
    required this.Amounttype,
    required this.Date,
    required this.totalValue,

  });

  factory salesModel.fromJson(Map<String, dynamic> json) {
    return salesModel(
      bill_number: json['bill_number '],
      id: json['user_id'],
      Username: json['user_name'],
      Amount: json['price'],
      Amounttype: json['payment_type'],
      Date: json[' date'],
      totalValue: json[' totalValue'],

    );
  }
}