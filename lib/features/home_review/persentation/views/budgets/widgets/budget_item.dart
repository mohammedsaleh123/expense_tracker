import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../cubit/expense_cubit.dart';

// ignore: must_be_immutable
class BudgetItem extends StatelessWidget {
   BudgetItem({
    super.key,
    required this.cubit,
    required this.index,
  });

  final ExpenseCubit cubit;
  int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
            DateFormat.yMMMEd()
                .format(DateTime.parse(cubit.budgets[index].incomeDate)),
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        Divider(
          height: 10.h,
          color: Colors.blue.shade700,
        ),
      ],
    );
  }
}
