import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../cubit/expense_cubit.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({
    super.key,
    required this.cubit,
  });

  final ExpenseCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ExpenseCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                cubit.getTransactions();
              },
              label: const Icon(Icons.refresh),
            ),
            TableCalendar(
              calendarFormat: CalendarFormat.twoWeeks,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  final transactionsOnDay = cubit.transactions
                      .where(
                        (transaction) => isSameDay(
                            DateTime.parse(transaction.transactionDate), day),
                      )
                      .toList();

                  if (transactionsOnDay.isNotEmpty) {
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                  return null;
                },
                todayBuilder: (context, day, focusedDay) {
                  final transactionsOnDay = cubit.transactions
                      .where(
                        (transaction) => isSameDay(
                            DateTime.parse(transaction.transactionDate), day),
                      )
                      .toList();

                  if (transactionsOnDay.isNotEmpty) {
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
              onDaySelected: (selectedDay, focusedDay) {
                cubit.changeExpensesByDate(selectedDay);
              },
            ),
          ],
        );
      },
    );
  }
}
