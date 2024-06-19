import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/expense_cubit.dart';

class AddBudgetDialog extends StatelessWidget {
  const AddBudgetDialog({
    super.key,
  });

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
        key: cubit.addBudgetKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add Budget',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: cubit.addBudgetController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Budget Amount',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter budget amount';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: cubit.budgetNameController,
                    maxLength: 15,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Budget Name',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter budget name';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (cubit.addBudgetKey.currentState!.validate()) {
                      cubit.addBudget();
                      Navigator.pop(context);
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
