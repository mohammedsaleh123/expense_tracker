import 'package:expense_tracker/features/home_review/persentation/views/home_review/review_view.dart';
import 'package:expense_tracker/features/home_review/persentation/views/transetions/transation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  List<Widget> pages = [
    const ReviewView(),
    const ExpenseReportPage(),
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(PageSelectedIndex());
  }
}
