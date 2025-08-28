part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

final class AddStudentEvent extends StudentEvent {
  final StudentModel studentModel;

  AddStudentEvent({required this.studentModel});
}

final class GetStudentEvent extends StudentEvent {}

final class DeleteStudentEvent extends StudentEvent {
  final StudentModel studentModel;

  DeleteStudentEvent({required this.studentModel});
}

final class GetByNameStudentEvent extends StudentEvent {
  final String name;

  GetByNameStudentEvent({required this.name});
}

final class UpdateStudentEvent extends StudentEvent {
  final StudentModel studentModel;

  UpdateStudentEvent({required this.studentModel});
}
