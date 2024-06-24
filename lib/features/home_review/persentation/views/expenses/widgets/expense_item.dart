import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../cubit/expense_cubit.dart';

// ignore: must_be_immutable
class ExpenseItem extends StatelessWidget {
   ExpenseItem({
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
                cubit.transactions[index].expenseType,
                style: TextStyle(color: Colors.grey, fontSize: 20.sp),
              ),
              Text(
                '\$ ${cubit.transactions[index].expense.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          title: FractionallySizedBox(
            widthFactor: cubit.transactions[index].expense / cubit.totalBudgets,
            alignment: Alignment.centerLeft,
            //heightFactor: 0.5,
            child: Container(
              height: 20.h,
              // width: size.width *
              //     (cubit.transactions[index].expense /
              //         cubit.totalBudgets)

              color: Colors.blue.shade500,
            ),
          ),
          subtitle: Text(
            DateFormat.yMMMEd().format(
                DateTime.parse(cubit.transactions[index].transactionDate)),
            style: const TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            onPressed: () {
              cubit.deleteTransaction(cubit.transactions[index].id!);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
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