import 'package:fpdart/fpdart.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/core/error/failure.dart';
import 'package:stu_management_sqllite/core/usecase/usecase.dart';
import '../../data/repository/student_repository_impl.dart';

final class DeleteUsecase implements UseCase<void, DeleteUseCaseParams> {
  final StudentRepositoryImpl studentRepositoryImpl;

  DeleteUsecase({required this.studentRepositoryImpl});
  @override
  Future<Either<Failure, void>> call(DeleteUseCaseParams params) async {
    return await studentRepositoryImpl.deleteStudent(
        studentModel: params.studentModel);
  }
}

class DeleteUseCaseParams {
  final StudentModel studentModel;
  DeleteUseCaseParams({required this.studentModel});
}
