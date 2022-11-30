import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/extension.dart';

class DatabaseHelper{
  static const _databaseName = 'MyRecipes.db';
  static const _databaseVersion = 1;
  static const recipeTable = "Recipe";
  static const ingredientTable = "Ingredient";
  static const recipeId = 'recipeId';
  static const ingredientId = 'ingredientId';

  static late BriteDatabase _streamDatabase;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static var lock = Lock();

  static Database? _database;

  //TODO : ADD CREATE DATABASE CODE HERE
  Future _onCreate(Database db, int version) async{
    await db.execute(
        '''CREATE TABLE $recipeTable
    (
      $recipeId INTEGER PRIMARY KEY,
      label TEXT,
      image TEXT,
      url TEXT,
      calories REAL,
      totalWeight REAL,
      totalTime REAL,
    )
    ''');
    await db.execute('''
    CREATE TABLE $ingredientTable
    (
      $ingredientId INTEGER PRIMARY KEY,
      $recipeId INTEGER,
      name TEXT,
      weight REAL,
    ''');
  }
  //add code to open database
  Future<Database> _initDatabase() async{
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    Sqflite.setDebugModeOn(true);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }
  Future<Database> get database async{
    if(_database != null) return _database!;
    await lock.synchronized(() async{
      if(_database != null) return _database!;
      _database = await _initDatabase();
      _streamDatabase = BriteDatabase(_database!);
    });
    return _database!;
  }
  Future<BriteDatabase> get streamDatabase async{
    await database;
    return _streamDatabase;
  }
}