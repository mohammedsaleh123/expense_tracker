import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/transaction_model.dart';

abstract class TransactionDatabase {
  Future<Unit> openDB();
  Future<Unit> addTransaction(TransactionModel transactionModel);
  Future<Unit> deleteTransaction(int id);
  Future<List<TransactionModel>> getTransactions();
  Future<Unit> updateTransaction(int id, TransactionModel transactionModel);
}

class TransactionDatabaseImpl implements TransactionDatabase {
  late Database database;
  final String _tableName = 'transaction.db';

  @override
  Future<Unit> openDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, _tableName);

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE "transaction"(id INTEGER PRIMARY KEY,expense DOUBLE,expenseName TEXT, expenseType TEXT,transactionDate TEXT)');
    });
    return unit;
  }

  @override
  Future<Unit> addTransaction(TransactionModel transactionModel) async {
    await openDB();
    await database.insert('transaction', transactionModel.toJson());
    return unit;
  }

  @override
  Future<Unit> deleteTransaction(int id) async {
    await openDB();
    await database.delete('transaction', where: 'id = ?', whereArgs: [id]);
    return unit;
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    await openDB();
    List<Map<String, dynamic>> maps = await database.query('transaction');
    return maps
        .map((transaction) => TransactionModel(
              id: transaction['id'],
              expenseName: transaction['expenseName'],
              expense: transaction['expense'],
              expenseType: transaction['expenseType'],
              transactionDate: transaction['transactionDate'],
            ))
        .toList();
  }

  @override
  Future<Unit> updateTransaction(
      int id, TransactionModel transactionModel) async {
    await openDB();
    await database.update('transaction', transactionModel.toJson(),
        where: 'id = ?', whereArgs: [id]);
    return unit;
  }
}
