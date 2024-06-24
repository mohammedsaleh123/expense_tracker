import 'package:expense_tracker/features/home_review/persentation/views/budgets/budgets_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_review/persentation/views/expenses/expenses_list.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 1;
  List<Widget> pages = [
    const BudgetsList(),
    const ExpensesList(),
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(PageSelectedIndex());
  }
}
