import 'package:fpdart/fpdart.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/core/error/failure.dart';
import 'package:stu_management_sqllite/core/usecase/usecase.dart';
import '../../data/repository/student_repository_impl.dart';

final class GetUsecase implements UseCase<List<StudentModel>, NoParams> {
  final StudentRepositoryImpl studentRepositoryImpl;

  GetUsecase({required this.studentRepositoryImpl});

  @override
  Future<Either<Failure, List<StudentModel>>> call(params) async {
    return await studentRepositoryImpl.getStudents();
  }
}
