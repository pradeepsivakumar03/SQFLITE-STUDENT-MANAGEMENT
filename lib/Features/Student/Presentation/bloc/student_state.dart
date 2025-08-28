part of 'student_bloc.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}

final class StudentLoading extends StudentState {}

final class StudentDeleteSuccess extends StudentState {}

final class StudentDeleteFailure extends StudentState {
  final String errorMsg;

  StudentDeleteFailure({required this.errorMsg});
}

final class StudentFailure extends StudentState {
  final Failure errorMsg;

  StudentFailure({required this.errorMsg});
}

final class StudentSuccess extends StudentState {}

final class StudentFetchSuccess extends StudentState {
  final List<StudentModel> studentModels;

  StudentFetchSuccess({required this.studentModels});
}
