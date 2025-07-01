class TransactionModel {
  String senderName;
  String receiverName;
  String receiverImage;
  String status;
  String statusActionSymbol;
  String transactionDate;
  int amount;
  TransactionModel({
    required this.senderName,
    required this.receiverName,
    required this.receiverImage,
    required this.status,
    required this.statusActionSymbol,
    required this.amount,
    required this.transactionDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'senderName': senderName,
      'receiverName': receiverName,
      'receiverImage': receiverImage,
      'status': status,
      'statusActionSymbol': statusActionSymbol,
      'amount': amount,
      'transactionDate': transactionDate,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> map) {
    return TransactionModel(
      senderName: map['senderName'] ?? '',
      receiverName: map['receiverName'] ?? '',
      receiverImage: map['receiverImage'] ?? '',
      status: map['status'] ?? '',
      statusActionSymbol: map['statusActionSymbol'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      transactionDate: map['transactionDate'] ?? '',
    );
  }
}
