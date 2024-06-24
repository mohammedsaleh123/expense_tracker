import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/expense_cubit.dart';

// ignore: must_be_immutable
class AddTransactionDialog extends StatelessWidget {
  const AddTransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ExpenseCubit>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade900,
            Colors.blue.shade800,
            Colors.blue.shade600,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Form(
        key: cubit.addTransactionKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: cubit.addTransactionController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Transaction Amount',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Transaction amount';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: cubit.addTransactionNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Transaction Name',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter transaction name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cubit.typeTransactionController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Transaction Type',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Choose transaction Type';
                            }
                            return null;
                          },
                        ),
                      ),
                      DropdownButton(
                        hint: const Text(
                          'Choose the Type',
                          style: TextStyle(color: Colors.white),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Food',
                            child: Text('Food'),
                          ),
                          DropdownMenuItem(
                            value: 'Travel',
                            child: Text('Travel'),
                          ),
                          DropdownMenuItem(
                            value: 'Clothes',
                            child: Text('Clothes'),
                          ),
                        ],
                        //value: valueName,
                        onChanged: (value) {
                          cubit.typeTransactionController.text = value!;
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (cubit.addTransactionKey.currentState!.validate()) {
                      if ((cubit.totalTransaction +
                              double.parse(
                                  cubit.addTransactionController.text)) <=
                          cubit.totalBudgets) {
                        cubit.addTransaction();
                        Navigator.pop(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: const EdgeInsets.all(0),
                            content: Container(
                              padding: EdgeInsets.all(20.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.shade900,
                                    Colors.blue.shade800,
                                    Colors.blue.shade600,
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ),
                              ),
                              child: const Text(
                                'cannot add transaction\n this transaction is biger than your budget',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Add Budget'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
