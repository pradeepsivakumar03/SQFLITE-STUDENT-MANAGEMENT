import 'package:fpdart/fpdart.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/Features/Student/data/repository/student_repository_impl.dart';
import 'package:stu_management_sqllite/core/error/failure.dart';
import 'package:stu_management_sqllite/core/usecase/usecase.dart';

final class AddUsecase implements UseCase<void, AddUseCaseParams> {
  final StudentRepositoryImpl studentRepositoryImpl;

  AddUsecase({required this.studentRepositoryImpl});

  @override
  Future<Either<Failure, void>> call(AddUseCaseParams params) async {
    return await studentRepositoryImpl.addStudent(
        studentModel: params.studentModel);
  }
}

class AddUseCaseParams {
  final StudentModel studentModel;

  AddUseCaseParams({required this.studentModel});
}
