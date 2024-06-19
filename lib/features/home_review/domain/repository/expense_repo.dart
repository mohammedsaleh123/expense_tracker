import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/home_review/domain/entities/budget_entity.dart';
import 'package:expense_tracker/features/home_review/domain/entities/transaction_entity.dart';

abstract class ExpenseRepo {
  Future<Unit> addBudget(
      double income, String incomeName, String incomeDate);

  Future<Unit> addTransaction(
      double expense,String expenseName, String expenseType, String transactionDate);

  Future<Unit> updateBudget(
      int? id, double income, String incomeName, String incomeDate);

  Future<Unit> updateTransaction(
      int? id, double expense,String expenseName, String expenseType, String transactionDate);

  Future<Unit> deleteTransaction(int id);

  Future<Unit> deleteBudget(int id);

  Future<Either<Failure, List<BudgetEntity>>> getBudgets();

  Future<Either<Failure, List<TransactionEntity>>> getTransactions();
}
