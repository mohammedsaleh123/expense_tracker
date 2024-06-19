import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BudgetEntity extends Equatable {
  int? id;
  double totalIncome;
  String incomeName;
  String incomeDate;

  BudgetEntity({
    this.id,
    required this.totalIncome,
    required this.incomeName,
    required this.incomeDate,
  });

  @override
  List<Object?> get props => [totalIncome, incomeName, incomeDate];
}
