import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final serviceLocator = GetIt.instance;

Future<void> initdependencies() async {
  Database? database;
  database = await getdatabase(database);
  serviceLocator.registerLazySingleton(() => database!);
}

Future<Database> getdatabase(Database? database) async {
  if (database != null) return database;
  database = await _initDB('students.db');
  return database;
}

Future<Database> _initDB(String filePath) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, filePath);

  return await openDatabase(path, version: 1, onCreate: _createDB);
}

Future _createDB(Database db, int version) async {
  const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  const textType = 'TEXT NOT NULL';

  await db.execute('''
CREATE TABLE students ( 
  id $idType, 
  name $textType,
  rollno $textType,
  curClass $textType,
  section $textType,
  bloodGroup $textType,
  address $textType,
  parentPhno $textType
  )
''').then((_) => log("Created"));
}
