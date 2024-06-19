import 'package:equatable/equatable.dart';
import 'package:expense_tracker/features/home_review/domain/entities/budget_entity.dart';
import 'package:expense_tracker/features/home_review/domain/entities/transaction_entity.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/budget_use_cases/add_budget_use_case.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/budget_use_cases/delete_budget_use_case.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/budget_use_cases/get_budgets_use_case.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/budget_use_cases/update_budget_use_case.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/transaction_use_cases/add_transaction_use_case.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/transaction_use_cases/delete_transaction_use_cases.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/transaction_use_cases/get_transaction_use_cases.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/transaction_use_cases/update_transactions_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit({
    required this.addBudgetUseCase,
    required this.updateBudgetUseCase,
    required this.deleteBudgetUseCase,
    required this.getBudgetsUseCase,
    required this.addTransactionUseCase,
    required this.updateTransactionsUseCases,
    required this.deleteTransactionUseCases,
    required this.getTransactionUseCases,
  }) : super(ExpenseInitial());
  AddBudgetUseCase addBudgetUseCase;
  UpdateBudgetUseCase updateBudgetUseCase;
  DeleteBudgetUseCase deleteBudgetUseCase;
  GetBudgetsUseCase getBudgetsUseCase;
  AddTransactionUseCase addTransactionUseCase;
  UpdateTransactionsUseCases updateTransactionsUseCases;
  DeleteTransactionUseCases deleteTransactionUseCases;
  GetTransactionUseCases getTransactionUseCases;
  GlobalKey<FormState> addBudgetKey = GlobalKey<FormState>();
  GlobalKey<FormState> addTransactionKey = GlobalKey<FormState>();
  TextEditingController addBudgetController = TextEditingController();
  TextEditingController budgetNameController = TextEditingController();
  TextEditingController addTransactionController = TextEditingController();
  TextEditingController addTransactionNameController = TextEditingController();
  TextEditingController typeTransactionController = TextEditingController();

  List<BudgetEntity> budgets = [];
  List<TransactionEntity> transactions = [];
  double totalBudgets = 0;
  double totalTransaction = 0;

  Future<void> addBudget() async {
    emit(AddBudgetLoading());
    try {
      await addBudgetUseCase
          .call(
        double.parse(addBudgetController.text),
        budgetNameController.text,
        DateTime.now().toString(),
      )
          .then(
        (value) {
          emit(AddBudgetSuccess());
          getBudgets();
          addBudgetController.clear();
          budgetNameController.clear();
        },
      );
    } catch (e) {
      emit(AddBudgetError(e.toString()));
    }
  }

  Future<void> updateBudget(
      int? id, double income, String incomeName, String incomeDate) async {
    emit(UpdateBudgetLoading());
    try {
      await updateBudgetUseCase
          .call(id, income, incomeName, incomeDate)
          .then((value) {
        emit(UpdateBudgetSuccess());
        getBudgets();
      });
    } catch (e) {
      emit(UpdateBudgetError(e.toString()));
    }
  }

  Future<void> deleteBudget(int id) async {
    emit(DeleteBudgetLoading());
    try {
      await deleteBudgetUseCase.call(id).then((value) {
        emit(DeleteBudgetSuccess());
        getBudgets();
      });
    } catch (e) {
      emit(DeleteBudgetError(e.toString()));
    }
  }

  Future<List<BudgetEntity>> getBudgets() async {
    emit(GetBudgetsLoading());
    final result = await getBudgetsUseCase.call();
    result.fold(
      (l) {
        emit(GetBudgetsError(l.toString()));
        budgets = [];
      },
      (r) {
        budgets = r;
        totalBudgets = r.isNotEmpty
            ? r.map((e) => e.totalIncome).reduce(
                (value, element) {
                  if (value + element <= 0) {
                    return 0;
                  }
                  return value + element;
                },
              )
            : 0;
        emit(GetBudgetsSuccess(r));
      },
    );
    return budgets;
  }

  Future<List<TransactionEntity>> getTransactions() async {
    emit(GetTransactionsLoading());
    final result = await getTransactionUseCases.call();
    result.fold(
      (l) {
        emit(GetTransactionsError(l.toString()));
        transactions = [];
      },
      (r) {
        transactions = r;
        totalTransaction = r.isNotEmpty
            ? r.map((e) => e.expense).reduce(
                (value, element) {
                  return value + element;
                },
              )
            : 0;
        emit(GetTransactionsSuccess(r));
      },
    );
    return transactions;
  }

  Future<void> addTransaction() async {
    emit(AddTransactionLoading());
    try {
      await addTransactionUseCase
          .call(
              double.parse(addTransactionController.text),
              addTransactionNameController.text,
              typeTransactionController.text,
              DateTime.now().toString())
          .then((value) {
        //getBudgets();
        emit(AddTransactionSuccess());
        getTransactions();
        addTransactionController.clear();
        addTransactionNameController.clear();
        typeTransactionController.clear();
      });
    } catch (e) {
      emit(AddTransactionError(e.toString()));
    }
  }

  Future<void> updateTransaction(int? id, double expense, String expenseName,
      String expenseType, String transactionDate) async {
    emit(UpdateTransactionLoading());
    try {
      await updateTransactionsUseCases
          .call(id, expense, expenseName, expenseType, transactionDate)
          .then((value) {
        emit(UpdateTransactionSuccess());
        getTransactions();
      });
    } catch (e) {
      emit(UpdateTransactionError(e.toString()));
    }
  }

  Future<void> deleteTransaction(int id) async {
    emit(DeleteTransactionLoading());
    try {
      await deleteTransactionUseCases.call(id).then((value) {
        emit(DeleteTransactionSuccess());
        getTransactions();
      });
    } catch (e) {
      emit(DeleteTransactionError(e.toString()));
    }
  }

}
