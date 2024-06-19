import 'package:expense_tracker/features/home_review/persentation/cubit/expense_cubit.dart';
import 'package:expense_tracker/features/home_review/persentation/views/home_review/widgets/budgets_list.dart';
import 'package:expense_tracker/features/home_review/persentation/views/home_review/widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/budget_banner.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseCubit, ExpenseState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<ExpenseCubit>(context);
        return DefaultTabController(
          length: 2,
          initialIndex: 1,
          animationDuration: const Duration(milliseconds: 500),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title:
                  const Text('Reviews', style: TextStyle(color: Colors.white)),
            ),
            body: Column(
              children: [
                Container(
                  height: 150.h,
                  width: double.infinity,
                  margin: EdgeInsets.all(10.sp),
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.blue.shade900,
                        Colors.blue.shade700,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: BudgetBanner(cubit: cubit),
                ),
                SizedBox(
                  height: 50.h,
                  child: const TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.white54,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        text: 'Budgets',
                      ),
                      Tab(
                        text: 'Transactions',
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      BudgetsList(),
                      TransactionsList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
