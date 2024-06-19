import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/home_review/domain/repository/expense_repo.dart';

class DeleteBudgetUseCase{
  ExpenseRepo repo;
  DeleteBudgetUseCase({required this.repo});
  Future<Unit> call(int id) async {
    return await repo.deleteBudget(id);
  }
}