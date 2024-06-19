import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TransactionEntity extends Equatable {
  int? id;
  String expenseName;
  String expenseType;
  double expense;
  String transactionDate;

  TransactionEntity({
    this.id,
    required this.expenseName,
    required this.expenseType,
    required this.expense,
    required this.transactionDate,
  });

  @override
  List<Object?> get props => [expenseName, expenseType, expense, transactionDate];
}
