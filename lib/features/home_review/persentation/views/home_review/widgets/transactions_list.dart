import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/expense_cubit.dart';
import 'add_transaction_dialog.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ExpenseCubit>(context);
        //final Size size = MediaQuery.of(context).size;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20.h),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    contentPadding: EdgeInsets.all(0),
                    content: AddTransactionDialog(),
                  ),
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Add Transaction',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: cubit.transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
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
                      widthFactor: cubit.transactions[index].expense /
                          cubit.totalBudgets,
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
                    trailing: IconButton(
                      onPressed: () {
                        cubit.deleteTransaction(cubit.transactions[index].id!);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
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
