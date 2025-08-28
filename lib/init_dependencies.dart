import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stu_management_sqllite/Features/Student/Presentation/bloc/student_bloc.dart';
import 'package:stu_management_sqllite/Features/Student/data/datasources/student_data_source.dart';
import 'package:stu_management_sqllite/Features/Student/data/repository/student_repository_impl.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/add_usecase.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/delete_usecase.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/get_by_name_usecase.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/get_usecase.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/update_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> initdependencies() async {
  Database? database;
  database = await getdatabase(database);
  serviceLocator.registerLazySingleton(() => database!);
  _studentBloc();
}

void _studentBloc() {
  serviceLocator
    ..registerFactory(() => StudentDataSourceImpl(database: serviceLocator()))
    ..registerFactory(
        () => StudentRepositoryImpl(studentDataSourceImpl: serviceLocator()))
    ..registerFactory(() => AddUsecase(studentRepositoryImpl: serviceLocator()))
    ..registerFactory(() => GetUsecase(studentRepositoryImpl: serviceLocator()))
    ..registerFactory(
        () => DeleteUsecase(studentRepositoryImpl: serviceLocator()))
    ..registerFactory(
        () => GetByNameUsecase(studentRepositoryImpl: serviceLocator()))
    ..registerFactory(
        () => UpdateUsecase(studentRepositoryImpl: serviceLocator()))
    ..registerLazySingleton(() => StudentBloc(
          addUseCase: serviceLocator(),
          deleteUsecase: serviceLocator(),
          getByNameUsecase: serviceLocator(),
          getUsecase: serviceLocator(),
          updateUsecase: serviceLocator(),
        ));
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
