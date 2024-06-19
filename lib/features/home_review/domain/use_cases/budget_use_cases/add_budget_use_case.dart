import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/home_review/domain/repository/expense_repo.dart';

class AddBudgetUseCase {
  ExpenseRepo repo;
  AddBudgetUseCase({required this.repo});
  Future<Unit> call(double income, String incomeName, String incomeDate) async {
    return await repo.addBudget(income, incomeName, incomeDate);
  }
}
