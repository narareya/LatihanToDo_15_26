import 'package:noted/models/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, taskName TEXT, dueDate TEXT, category TEXT, priority TEXT, isDone INTEGER)',
        );
      },
    );
  }

  Future<int> addTasks(TaskModel task) async {
    final client = await db;
    return client.insert('tasks', task.toMap());
  }

  Future<int> updateTasks(TaskModel task) async {
    final client = await db;
    return await client.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id],);
  }

  Future<List<TaskModel>> getTasks() async {
    final client = await db;
    final res = await client.query('tasks', orderBy: 'id DESC');
    return res.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<int> deleteTasks(int id) async {
    final client = await db;
    return await client.delete(
      'tasks', where: 'id = ?', whereArgs: [id],);
  } 
}
