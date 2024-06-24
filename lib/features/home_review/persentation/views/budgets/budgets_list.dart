import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/expense_cubit.dart';
import 'widgets/budget_banner.dart';
import 'widgets/budget_item.dart';

class BudgetsList extends StatelessWidget {
  const BudgetsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ExpenseCubit>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade900.withOpacity(0.5),
            title: const Text(
              'Budgets',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
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
            child: Column(
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
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.budgets.length,
                    itemBuilder: (context, index) {
                      return BudgetItem(cubit: cubit, index: index);
                    },
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
