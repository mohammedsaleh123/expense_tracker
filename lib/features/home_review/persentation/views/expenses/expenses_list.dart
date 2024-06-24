import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/expense_cubit.dart';
import 'widgets/add_transaction_dialog.dart';
import 'widgets/custom_calender.dart';
import 'widgets/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
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
              'Expense Report',
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
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 10.h),
                Container(
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
                  child: CustomCalender(cubit: cubit),
                ),
                SizedBox(height: 10.h),
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
                    minimumSize: Size(MediaQuery.sizeOf(context).width, 50.h),
                    backgroundColor: Colors.blue.shade700,
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.filteredTransactions.length,
                    itemBuilder: (context, index) {
                      return ExpenseItem(cubit: cubit, index: index);
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
