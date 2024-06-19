import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/home_review/domain/repository/expense_repo.dart';

import '../../../../../core/failure/failure.dart';
import '../../entities/transaction_entity.dart';

class GetTransactionUseCases{
  ExpenseRepo expenseRepo;
  GetTransactionUseCases({required this.expenseRepo});
  Future<Either<Failure, List<TransactionEntity>>> call()async{
    return await expenseRepo.getTransactions();
  }
}