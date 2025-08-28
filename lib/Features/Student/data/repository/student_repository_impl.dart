import 'package:fpdart/fpdart.dart';
import 'package:stu_management_sqllite/Features/Student/data/datasources/student_data_source.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/Features/Student/domain/repository/student_repository.dart';
import 'package:stu_management_sqllite/core/error/failure.dart';

final class StudentRepositoryImpl implements StudentRepository {
  final StudentDataSourceImpl studentDataSourceImpl;

  StudentRepositoryImpl({required this.studentDataSourceImpl});

  @override
  Future<Either<Failure, void>> addStudent(
      {required StudentModel studentModel}) async {
    try {
      final res =
          await studentDataSourceImpl.addStudent(studentModel: studentModel);
      return right(res);
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteStudent(
      {required StudentModel studentModel}) async {
    try {
      final res =
          await studentDataSourceImpl.deleteStudent(studentModel: studentModel);
      return right(res);
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StudentModel?>> getStudentByName(
      {required String name}) async {
    try {
      final res = await studentDataSourceImpl.getStudentByName(name: name);
      return right(res);
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StudentModel>>> getStudents() async {
    try {
      final res = await studentDataSourceImpl.getStudents();
      return right(res);
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateStudent(
      {required StudentModel studentModel}) async {
    try {
      final res =
          await studentDataSourceImpl.updateStudent(studentModel: studentModel);
      return right(res);
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }
}
