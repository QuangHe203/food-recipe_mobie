import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MealDB {
  final String user_email;
  final String meal_name;

  MealDB({required this.user_email, required this.meal_name});

  Map<String, dynamic> toMap() {
    return {'user_email': user_email, 'meal_name': meal_name};
  }
}

class Favourite {
  static Database? _database;
  static const _tableName = 'favourite';

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'app.db');

    final db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, user_email TEXT, meal_name TEXT)',
        );
      },
    );

    return db;
  }

  static Future<int> insertMeal(MealDB meal) async {
    final db = await database;
    return db.insert(_tableName, meal.toMap());
  }

  static Future<bool> Check(String mealName, String userEmail) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'meal_name = ? AND user_email = ?',
      whereArgs: [mealName, userEmail],
    );
    return maps.isNotEmpty;
  }

  static Future<List<MealDB>> getMeals(String userEmail) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'user_email = ?',
      whereArgs: [userEmail],
    );
    return List.generate(maps.length, (i) {
      return MealDB(
        user_email: maps[i]['user_email'],
        meal_name: maps[i]['meal_name'],
      );
    });
  }

  static Future<int> deleteMeal(String mealName, String userName) async {
    final db = await database;
    return db.delete(
      _tableName,
      where: 'meal_name = ? AND user_email = ?',
      whereArgs: [mealName, userName],
    );
  }

  static Future<int> deleteAllMeals() async {
    final db = await database;
    return db.delete(_tableName);
  }


  static Future<List<MealDB>> getAllMeals() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return MealDB(
        user_email: maps[i]['user_email'],
        meal_name: maps[i]['meal_name'],
      );
    });
  }
}
