import 'package:flutter/foundation.dart' show immutable;
import 'package:sqflite/sqflite.dart';

import '../models/student_model.dart';

@immutable
abstract interface class StudentDataSource {
  Future<void> addStudent({required StudentModel studentModel});
  Future<List<StudentModel>> getStudents();
  Future<void> updateStudent({required StudentModel studentModel});
  Future<void> deleteStudent({required StudentModel studentModel});
  Future<void> getStudentByName({required String name});
}

final class StudentDataSourceImpl implements StudentDataSource {
  final Database database;

  StudentDataSourceImpl({required this.database});
  @override
  Future<void> addStudent({required StudentModel studentModel}) async {
    try {
      await database.insert('students', studentModel.toJson());
      return;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> deleteStudent({required StudentModel studentModel}) {
    // TODO: implement deleteStudent
    throw UnimplementedError();
  }

  @override
  Future<void> getStudentByName({required String name}) {
    // TODO: implement getStudentByName
    throw UnimplementedError();
  }

  @override
  Future<List<StudentModel>> getStudents() {
    // TODO: implement getStudents
    throw UnimplementedError();
  }

  @override
  Future<void> updateStudent({required StudentModel studentModel}) {
    // TODO: implement updateStudent
    throw UnimplementedError();
  }
}
