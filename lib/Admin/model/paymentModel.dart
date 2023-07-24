class paymentModel {
  final String bill_number;
  final String id;
  final String Username;
  final String Amount;
  final String Amounttype;
  final String Date;
  final String Time;
  final String totalValue;


  paymentModel({
    required this. bill_number,
    required this.id,
    required this.Username,
    required this.Amount,
    required this.Amounttype,
    required this.Date,
    required this.Time,
    required this.totalValue,

  });

  factory paymentModel.fromJson(Map<String, dynamic> json) {
    return paymentModel(
      bill_number: json['bill_number '],
      id: json['user_id'],
      Username: json['user_name'],
      Amount: json['price'],
      Amounttype: json['payment_type'],
      Date: json[' date'],
      Time: json[' time'],
      totalValue: json[' totalValue'],

    );
  }
}