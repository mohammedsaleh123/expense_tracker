import '../../domain/entities/transaction_entity.dart';

// ignore: must_be_immutable
class TransactionModel extends TransactionEntity {
  TransactionModel({
    super.id,
    required super.expenseName,
    required super.expenseType,
    required super.expense,
    required super.transactionDate,
  });

  // تحويل من/إلى JSON للتخزين في قاعدة البيانات أو ملفات JSON
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      expenseName: json['expenseName'],
      expenseType: json['expenseType'],
      expense: json['expense'],
      transactionDate: json['transactionDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'expenseName':expenseName,
      'expenseType': expenseType,
      'expense': expense,
      'transactionDate': transactionDate,
    };
  }
}
