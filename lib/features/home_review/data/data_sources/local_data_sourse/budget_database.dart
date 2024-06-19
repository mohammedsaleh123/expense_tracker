import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/home_review/data/models/budget_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BudgetDatabase {
  Future<Unit> openDB();
  Future<Unit> addBudget(BudgetModel budgetModel);
  Future<Unit> updateBudget(int id, BudgetModel budgetModel);
  Future<Unit> deleteBudget(int id);
  Future<List<BudgetModel>> getBudgets();
}

class BudgetDatabaseImpl implements BudgetDatabase {
  late Database database;
  final String _tableName = 'budget.db';
  @override
  Future<Unit> openDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, _tableName);

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE budget(id INTEGER PRIMARY KEY, totalIncome DOUBLE, incomeName TEXT, incomeDate TEXT)');
    });
    return unit;
  }

  @override
  Future<Unit> addBudget(BudgetModel budgetModel) async {
    await openDB();
    await database.insert('budget', budgetModel.toJson());
    return unit;
  }

  @override
  Future<Unit> deleteBudget(int id) async {
    await openDB();
    await database.delete('budget', where: 'id = ?', whereArgs: [id]);
    return unit;
  }

  @override
  Future<List<BudgetModel>> getBudgets() async {
    await openDB();
    List<Map<String, dynamic>> maps = await database.query('budget');
    return maps
        .map((budget) => BudgetModel(
              id: budget['id'],
              totalIncome: budget['totalIncome'],
              incomeName: budget['incomeName'],
              incomeDate: budget['incomeDate'],
            ))
        .toList();
  }

  @override
  Future<Unit> updateBudget(int id, BudgetModel budgetModel) async {
    await openDB();
    await database.update('budget', budgetModel.toJson(),
        where: 'id = ?', whereArgs: [id]);
    return unit;
  }
}
