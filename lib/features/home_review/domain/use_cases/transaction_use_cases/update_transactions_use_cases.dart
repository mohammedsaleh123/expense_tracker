import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/home_review/domain/repository/expense_repo.dart';

class UpdateTransactionsUseCases{
  ExpenseRepo expenseRepo;
  UpdateTransactionsUseCases({required this.expenseRepo});
  Future<Unit> call(int? id, double expense,String expenseName, String expenseType, String transactionDate) async {
    return await expenseRepo.updateTransaction(id, expense,expenseName, expenseType, transactionDate);
  }
}