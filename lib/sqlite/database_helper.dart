import 'dart:async';
import 'package:path/path.dart';
import 'package:sqlbrite/sqlbrite.dart';
import '../models/simple_recipe.dart';

class DatabaseHelper{
  final String id = 'id';
  final String dishImage = 'dishImage';
  final String title = 'title';
  final String duration = 'duration';
  final String source = 'source';
  final String information = 'information';
  final String tablename = 'resep';
  //private constructor
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();
  //setup database
  static Database? _database;
  //create database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  //create datahase
  Future<Database> initDB() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'fooderlich.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    var sql = 'CREATE TABLE $tablename($id TEXT PRIMARY KEY,'
        '$dishImage TEXT, $title TEXT, $duration TEXT, $source TEXT,'
        '$information TEXT)';
    await db.execute(sql);
  }

  Future<int> addResep(SimpleRecipe recipe) async{
    final dbClient = await database;
    final res = await dbClient!.insert(tablename, recipe.toMap());
    print("id : $res berhasil ditambahkan");
    return res;
  }

  Future<int> deleteResep(String id) async{
    final dbClient = await database;
    final res = await dbClient!.delete(
        tablename,
        where: 'id = ?',
        whereArgs: [id]);
    return res;
  }

  Future<List> getAllid() async{
    final dbClient = await database;
    final res = await dbClient!.query(tablename, columns: [id]);
    List<String> list = res.isNotEmpty ? res.map((c) => c['id'].toString()).toList() : [];
    return list;
  }
  //get data
  Future<List<SimpleRecipe>> getAllResep() async{
    final dbClient = await database;
    final res = await dbClient!.query(tablename, columns: [id, dishImage, title, duration, source]);
    final list = res.toList();
    List<SimpleRecipe> recipes = [];
    for(var i = 0; i < list.length; i++){
      recipes.add(SimpleRecipe.fromMap(list[i]));
    }

    return recipes;
  }

}