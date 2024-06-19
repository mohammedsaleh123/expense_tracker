import 'package:dartz/dartz.dart';

import '../../repository/expense_repo.dart';

class UpdateBudgetUseCase{

   ExpenseRepo repo;
  UpdateBudgetUseCase({required this.repo});
  Future<Unit> call(int? id,double income,String incomeName,String incomeDate) async {
    return await repo.updateBudget(id, income, incomeName, incomeDate);
  }
}