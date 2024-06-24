part of 'expense_cubit.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

final class ExpenseInitial extends ExpenseState {}

final class AddBudgetLoading extends ExpenseState {}

final class AddBudgetSuccess extends ExpenseState {}

final class AddBudgetError extends ExpenseState {
  final String message;

  const AddBudgetError(this.message);
}

final class AddTransactionLoading extends ExpenseState {}

final class AddTransactionSuccess extends ExpenseState {}

final class AddTransactionError extends ExpenseState {
  final String message;

  const AddTransactionError(this.message);
}

final class UpdateTransactionLoading extends ExpenseState {}

final class UpdateTransactionSuccess extends ExpenseState {}

final class UpdateTransactionError extends ExpenseState {
  final String message;

  const UpdateTransactionError(this.message);
}

final class DeleteTransactionLoading extends ExpenseState {}

final class DeleteTransactionSuccess extends ExpenseState {}

final class DeleteTransactionError extends ExpenseState {
  final String message;

  const DeleteTransactionError(this.message);
}

final class GetTransactionsLoading extends ExpenseState {}

final class GetTransactionsSuccess extends ExpenseState {
  final List<TransactionEntity> transactions;
  const GetTransactionsSuccess(this.transactions);
}

final class GetTransactionsError extends ExpenseState {
  final String message;

  const GetTransactionsError(this.message);
}

final class UpdateBudgetLoading extends ExpenseState {}

final class UpdateBudgetSuccess extends ExpenseState {}

final class UpdateBudgetError extends ExpenseState {
  final String message;

  const UpdateBudgetError(this.message);
}

final class DeleteBudgetLoading extends ExpenseState {}

final class DeleteBudgetSuccess extends ExpenseState {}

final class DeleteBudgetError extends ExpenseState {
  final String message;

  const DeleteBudgetError(this.message);
}

final class GetBudgetsLoading extends ExpenseState {}

final class GetBudgetsSuccess extends ExpenseState {
  final List<BudgetEntity> budgets;
  const GetBudgetsSuccess(this.budgets);
}

final class GetBudgetsError extends ExpenseState {
  final String message;

  const GetBudgetsError(this.message);
}

final class ChangeExpensesByDateLoading extends ExpenseState {}

final class ChangeExpensesByDate extends ExpenseState {}