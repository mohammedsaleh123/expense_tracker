import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../cubit/expense_cubit.dart';
import 'add_budget_dialog.dart';

class BudgetBanner extends StatelessWidget {
  const BudgetBanner({
    super.key,
    required this.cubit,
  });

  final ExpenseCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Income',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
            Text(
              '\$ ${cubit.totalBudgets}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            )
          ],
        ),
        FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                      contentPadding: EdgeInsets.all(0),
                      content: AddBudgetDialog(),
                    ));
          },
          child: const Icon(Icons.add),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'Expense',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          CircularPercentIndicator(
            radius: 40.sp,
            lineWidth: 5.0,
            percent: cubit.totalTransaction / cubit.totalBudgets <= 1
                ? cubit.totalTransaction / cubit.totalBudgets
                : 0,
            center: Text(
                cubit.totalTransaction > 0
                    ? "${(100 * (cubit.totalTransaction / cubit.totalBudgets)).toStringAsFixed(2)}%"
                    : '0',
                style: const TextStyle(color: Colors.white)),
            progressColor: Colors.green,
          ),
        ]),
      ],
    );
  }
}
