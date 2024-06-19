import 'package:expense_tracker/features/home_review/data/data_sources/local_data_sourse/transaction_database.dart';
import 'package:expense_tracker/features/home_review/data/repo_impl/expense_repo_impl.dart';
import 'package:expense_tracker/features/home_review/domain/repository/expense_repo.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/budget_use_cases/add_budget_use_case.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/transaction_use_cases/delete_transaction_use_cases.dart';
import 'package:expense_tracker/features/home_review/domain/use_cases/transaction_use_cases/update_transactions_use_cases.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';
import 'features/home/persentation/cubit/home_cubit.dart';
import 'features/home_review/data/data_sources/local_data_sourse/budget_database.dart';
import 'features/home_review/domain/use_cases/budget_use_cases/delete_budget_use_case.dart';
import 'features/home_review/domain/use_cases/budget_use_cases/get_budgets_use_case.dart';
import 'features/home_review/domain/use_cases/budget_use_cases/update_budget_use_case.dart';
import 'features/home_review/domain/use_cases/transaction_use_cases/add_transaction_use_case.dart';
import 'features/home_review/domain/use_cases/transaction_use_cases/get_transaction_use_cases.dart';
import 'features/home_review/persentation/cubit/expense_cubit.dart';

GetIt sl = GetIt.instance;

init() {
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo());

  //Cubit
  sl.registerFactory<HomeCubit>(() => HomeCubit());
  sl.registerFactory<ExpenseCubit>(() => ExpenseCubit(
        addBudgetUseCase: sl(),
        updateBudgetUseCase: sl(),
        deleteBudgetUseCase: sl(),
        getBudgetsUseCase: sl(),
        addTransactionUseCase: sl(),
        updateTransactionsUseCases: sl(),
        deleteTransactionUseCases: sl(),
        getTransactionUseCases: sl(),
      ));
  //usecases
  sl.registerLazySingleton<AddBudgetUseCase>(() => AddBudgetUseCase(
        repo: sl(),
      ));
  sl.registerLazySingleton(() => GetBudgetsUseCase(
        repo: sl(),
      ));
  sl.registerLazySingleton(() => UpdateBudgetUseCase(
        repo: sl(),
      ));
  sl.registerLazySingleton(() => DeleteBudgetUseCase(
        repo: sl(),
      ));
      sl.registerLazySingleton(() => AddTransactionUseCase(
        expenseRepo: sl(),
      ));
      sl.registerLazySingleton(() => GetTransactionUseCases(
        expenseRepo: sl(),
      ));
      sl.registerLazySingleton(() => UpdateTransactionsUseCases(
        expenseRepo: sl(),
      ));
      sl.registerLazySingleton(() => DeleteTransactionUseCases(
        expenseRepo: sl(),
      ));
  //repository
  sl.registerLazySingleton<ExpenseRepo>(() => ExpenseRepoImpl(
        budgetDatabase: sl(),
        transactionDatabase: sl(),
      ));
  //data sources
  sl.registerLazySingleton<BudgetDatabase>(() => BudgetDatabaseImpl());
  sl.registerLazySingleton<TransactionDatabase>(() => TransactionDatabaseImpl());
}
