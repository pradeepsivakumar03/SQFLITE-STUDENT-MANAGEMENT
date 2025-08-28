import 'dart:developer';

import 'package:flutter/foundation.dart' show immutable;
import 'package:sqflite/sqflite.dart';
import 'package:stu_management_sqllite/core/error/failure.dart';

import '../models/student_model.dart';

@immutable
abstract interface class StudentDataSource {
  Future<void> addStudent({required StudentModel studentModel});
  Future<List<StudentModel>> getStudents();
  Future<void> updateStudent({required StudentModel studentModel});
  Future<void> deleteStudent({required StudentModel studentModel});
  Future<StudentModel?> getStudentByName({required String name});
}

final class StudentDataSourceImpl implements StudentDataSource {
  final Database database;

  StudentDataSourceImpl({required this.database});
  @override
  Future<void> addStudent({required StudentModel studentModel}) async {
    try {
      await database.insert('students', studentModel.toJson());
      log("Added");
      return;
    } catch (e) {
      log("Add error $e");
      throw Failure(errorMsg: e.toString());
    }
  }

  @override
  Future<void> deleteStudent({required StudentModel studentModel}) async {
    try {
      await database.delete(
        'students',
        where: 'id = ?',
        whereArgs: [studentModel.id],
      );
    } catch (e) {
      throw Failure(errorMsg: e.toString());
    }
  }

  @override
  Future<StudentModel?> getStudentByName({required String name}) async {
    try {
      final result = await database.query(
        'students',
        where: 'name = ?',
        whereArgs: [name],
      );

      if (result.isNotEmpty) {
        return StudentModel.fromJson(result.first);
      }
      return null;
    } catch (e) {
      throw Failure(errorMsg: e.toString());
    }
  }

  @override
  Future<List<StudentModel>> getStudents() async {
    try {
      final result = await database.query('students');

      return result.map((json) => StudentModel.fromJson(json)).toList();
    } catch (e) {
      throw Failure(errorMsg: e.toString());
    }
  }

  @override
  Future<void> updateStudent({required StudentModel studentModel}) async {
    try {
      await database.update(
        'students',
        studentModel.toJson(),
        where: 'id = ?',
        whereArgs: [studentModel.id],
      );
    } catch (e) {
      throw Failure(errorMsg: e.toString());
    }
  }
}
