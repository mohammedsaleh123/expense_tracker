import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../cubit/expense_cubit.dart';

class ExpenseReportPage extends StatefulWidget {
  const ExpenseReportPage({super.key});

  @override
  State<ExpenseReportPage> createState() => _ExpenseReportPageState();
}

class _ExpenseReportPageState extends State<ExpenseReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Expense Report',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<ExpenseCubit, ExpenseState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetTransactionsSuccess) {
            final transactions = state.transactions;
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Weekly Expenses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        final transactionsOnDay = transactions
                            .where(
                              (transaction) => isSameDay(
                                  DateTime.parse(transaction.transactionDate),
                                  day),
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
                        final transactionsOnDay = transactions
                            .where(
                              (transaction) => isSameDay(
                                  DateTime.parse(transaction.transactionDate),
                                  day),
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
                  ),
                  // WeeklyExpenseChart(transactions: transactions),
                  // const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Text(
                  //     'Monthly Expenses',
                  //     style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white),
                  //   ),
                  // ),
                  // MonthlyExpenseChart(transactions: transactions),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
