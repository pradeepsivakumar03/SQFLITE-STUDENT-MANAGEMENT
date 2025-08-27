import 'package:flutter/foundation.dart' show immutable;
import '../../data/models/student_model.dart';

@immutable
abstract interface class StudentRepository {
  Future<void> addStudent({required StudentModel studentModel});
  Future<List<StudentModel>> getStudents();
  Future<void> updateStudent({required StudentModel studentModel});
  Future<void> deleteStudent({required StudentModel studentModel});
  Future<void> getStudentByName({required String name});
}
