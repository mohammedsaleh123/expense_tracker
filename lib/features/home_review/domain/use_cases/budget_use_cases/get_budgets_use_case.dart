import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/home_review/domain/repository/expense_repo.dart';

import '../../../../../core/failure/failure.dart';
import '../../entities/budget_entity.dart';

class GetBudgetsUseCase{
  ExpenseRepo repo;
  GetBudgetsUseCase({required this.repo});
  Future<Either<Failure, List<BudgetEntity>>> call() async {
    return await repo.getBudgets();
  }
}