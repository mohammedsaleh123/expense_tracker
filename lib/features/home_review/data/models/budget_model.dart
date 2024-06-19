import '../../domain/entities/budget_entity.dart';

// ignore: must_be_immutable
class BudgetModel extends BudgetEntity {
  BudgetModel({
      super.id,
    required super.totalIncome,
    required super.incomeName,
    required super.incomeDate,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) {
    return BudgetModel(
      id: json['id'],
      totalIncome: json['totalIncome'],
      incomeName: json['transactions'],
      incomeDate: json['incomeDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'totalIncome': totalIncome,
      'incomeName': incomeName,
      'incomeDate': incomeDate,
    };
  }
}
