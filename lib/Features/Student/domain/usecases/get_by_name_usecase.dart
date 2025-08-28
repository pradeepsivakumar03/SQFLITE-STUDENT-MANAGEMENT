import 'package:fpdart/fpdart.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/core/error/failure.dart';
import 'package:stu_management_sqllite/core/usecase/usecase.dart';

import '../../data/repository/student_repository_impl.dart';

final class GetByNameUsecase
    implements UseCase<StudentModel?, GetByNameUseCaseParams> {
  final StudentRepositoryImpl studentRepositoryImpl;

  GetByNameUsecase({required this.studentRepositoryImpl});
  @override
  Future<Either<Failure, StudentModel?>> call(
      GetByNameUseCaseParams params) async {
    return await studentRepositoryImpl.getStudentByName(name: params.name);
  }
}

class GetByNameUseCaseParams {
  final String name;

  GetByNameUseCaseParams({required this.name});
}
