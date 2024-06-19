import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/home_review/domain/repository/expense_repo.dart';

class AddTransactionUseCase {
  ExpenseRepo expenseRepo;
  AddTransactionUseCase({required this.expenseRepo}); 
  Future<Unit> call(double expense,String expenseName, String expenseType, String transactionDate) async {
    return await expenseRepo.addTransaction(expense,expenseName, expenseType, transactionDate);
  }
}