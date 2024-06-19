import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/home_review/domain/repository/expense_repo.dart';

class DeleteTransactionUseCases{
  ExpenseRepo expenseRepo;
  DeleteTransactionUseCases({required this.expenseRepo});
  Future<Unit> call(int id)async{
    return await expenseRepo.deleteTransaction(id);
  }
}