import 'package:MyToDoApp/databases/Todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Create a private constructor
  DatabaseHelper();

  static const databaseName = 'todos_database.db';
  static final DatabaseHelper instance = DatabaseHelper();
  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      return await initializeDatabase();
    }
    return _database;
  }

  Future<List<Todo>> retrieveTodos() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(Todo.TABLE_NAME);
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }

  initializeDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, content TEXT)");
        });
  }
}