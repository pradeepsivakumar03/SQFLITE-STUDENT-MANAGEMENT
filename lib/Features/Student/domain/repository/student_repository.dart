import 'package:flutter/foundation.dart' show immutable;
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/student_model.dart';

@immutable
abstract interface class StudentRepository {
  Future<Either<Failure, void>> addStudent(
      {required StudentModel studentModel});
  Future<Either<Failure, List<StudentModel>>> getStudents();
  Future<Either<Failure, void>> updateStudent(
      {required StudentModel studentModel});
  Future<Either<Failure, void>> deleteStudent(
      {required StudentModel studentModel});
  Future<Either<Failure, StudentModel?>> getStudentByName(
      {required String name});
}
