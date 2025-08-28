import 'package:fpdart/fpdart.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/core/error/failure.dart';
import 'package:stu_management_sqllite/core/usecase/usecase.dart';
import '../../data/repository/student_repository_impl.dart';

final class UpdateUsecase implements UseCase<void, UpdateUseCaseParams> {
  final StudentRepositoryImpl studentRepositoryImpl;

  UpdateUsecase({required this.studentRepositoryImpl});

  @override
  Future<Either<Failure, void>> call(UpdateUseCaseParams params) async {
    return await studentRepositoryImpl.updateStudent(
        studentModel: params.studentModel);
  }
}

class UpdateUseCaseParams {
  final StudentModel studentModel;

  UpdateUseCaseParams({required this.studentModel});
}
