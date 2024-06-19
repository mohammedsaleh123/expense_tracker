import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../cubit/expense_cubit.dart';

class BudgetsList extends StatelessWidget {
  const BudgetsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ExpenseCubit>(context);
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cubit.budgets.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(12.sp),
                    leading: Column(
                      children: [
                        Text(
                          cubit.budgets[index].incomeName,
                          style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                        ),
                        Text(
                          '\$ ${cubit.budgets[index].totalIncome.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    trailing: Text(
                      DateFormat.yMMMEd().format(
                          DateTime.parse(cubit.budgets[index].incomeDate)),
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onLongPress: () {
                      cubit.deleteBudget(cubit.budgets[index].id!);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
