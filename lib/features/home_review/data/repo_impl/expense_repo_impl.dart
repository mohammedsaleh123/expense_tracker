import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/failure/exceptions.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/home_review/data/data_sources/local_data_sourse/transaction_database.dart';
import 'package:expense_tracker/features/home_review/data/models/budget_model.dart';
import 'package:expense_tracker/features/home_review/data/models/transaction_model.dart';

import '../../domain/repository/expense_repo.dart';
import '../data_sources/local_data_sourse/budget_database.dart';

class ExpenseRepoImpl implements ExpenseRepo {
  BudgetDatabase budgetDatabase;
  TransactionDatabase transactionDatabase;

  ExpenseRepoImpl({required this.budgetDatabase, required this.transactionDatabase});
  @override
  Future<Unit> addBudget(
      double income, String incomeName, String incomeDate) async {
    try {
      await budgetDatabase.addBudget(BudgetModel(
          totalIncome: income, incomeName: incomeName, incomeDate: incomeDate));
      return unit;
    } on CacheException {
      throw CacheFailure();
    }
  }

  @override
  Future<Unit> addTransaction(double expense, String expenseName, String expenseType,
      String transactionDate) async {
    try {
      await transactionDatabase.addTransaction(TransactionModel(
          expense: expense,
          expenseName: expenseName,
          expenseType: expenseType,
          transactionDate: transactionDate));
      return unit;
    } on CacheException {
      throw CacheFailure();
    }
  }

  @override
  Future<Unit> deleteBudget(int id) async {
    try {
      await budgetDatabase.deleteBudget(id);
      return unit;
    } on CacheException {
      throw CacheFailure();
    }
  }

  @override
  Future<Unit> deleteTransaction(int id) async {
    try {
      await transactionDatabase.deleteTransaction(id);
      return unit;
    } on CacheException {
      throw CacheFailure();
    }
  }

  @override
  Future<Either<Failure, List<BudgetModel>>> getBudgets() async {
    try {
      List<BudgetModel> budgets = await budgetDatabase.getBudgets();
      return Right(budgets);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<TransactionModel>>> getTransactions() async {
    try {
      List<TransactionModel> transactions = await transactionDatabase
          .getTransactions();
      return Right(transactions);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Unit> updateBudget(
      int? id, double income, String incomeName, String incomeDate) async {
    try {
      await budgetDatabase.updateBudget(
          id!,
          BudgetModel(
              totalIncome: income,
              incomeName: incomeName,
              incomeDate: incomeDate));
      return unit;
    } on CacheException {
      throw CacheFailure();
    }
  }

  @override
  Future<Unit> updateTransaction(
      int? id, double expense,String expenseName, String expenseType, String transactionDate) async {
    try {
      await transactionDatabase.updateTransaction(
          id!,
          TransactionModel(
              id: id,
              expenseName: expenseName,
              expense: expense,
              expenseType: expenseType,
              transactionDate: transactionDate));
      return unit;
    } on CacheException {
      throw CacheFailure();
    }
  }
}
