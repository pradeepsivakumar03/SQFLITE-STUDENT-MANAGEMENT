import 'dart:developer';

import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/add_usecase.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/delete_usecase.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/get_by_name_usecase.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/get_usecase.dart';
import 'package:stu_management_sqllite/Features/Student/domain/usecases/update_usecase.dart';
import 'package:stu_management_sqllite/core/error/failure.dart';
import 'package:stu_management_sqllite/core/usecase/usecase.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final AddUsecase _addUsecase;
  final GetUsecase _getUsecase;
  final DeleteUsecase _deleteUsecase;
  final GetByNameUsecase _getByNameUsecase;
  final UpdateUsecase _updateUsecase;
  StudentBloc({
    required AddUsecase addUseCase,
    required GetUsecase getUsecase,
    required DeleteUsecase deleteUsecase,
    required GetByNameUsecase getByNameUsecase,
    required UpdateUsecase updateUsecase,
  })  : _addUsecase = addUseCase,
        _getUsecase = getUsecase,
        _deleteUsecase = deleteUsecase,
        _getByNameUsecase = getByNameUsecase,
        _updateUsecase = updateUsecase,
        super(StudentInitial()) {
    on<AddStudentEvent>((event, emit) async {
      final res =
          await _addUsecase(AddUseCaseParams(studentModel: event.studentModel));
      res.fold((l) => emit(StudentFailure(errorMsg: l)), (r) {
        emit(StudentSuccess());
        add(GetStudentEvent());
      });
    });

    on<GetStudentEvent>((event, emit) async {
      final res = await _getUsecase(NoParams());
      res.fold((l) => emit(StudentFailure(errorMsg: l)), (r) {
        emit(StudentFetchSuccess(studentModels: r));
      });
    });

    on<DeleteStudentEvent>((event, emit) async {
      final res = await _deleteUsecase(
          DeleteUseCaseParams(studentModel: event.studentModel));
      res.fold((l) => emit(StudentFailure(errorMsg: l)), (r) {
        emit(StudentSuccess());
        add(GetStudentEvent());
      });
    });

    on<GetByNameStudentEvent>((event, emit) async {
      final res =
          await _getByNameUsecase(GetByNameUseCaseParams(name: event.name));
      res.fold((l) => emit(StudentFailure(errorMsg: l)),
          (r) => emit(StudentSuccess()));
    });

    on<UpdateStudentEvent>((event, emit) async {
      final res = await _updateUsecase(
          UpdateUseCaseParams(studentModel: event.studentModel));
      res.fold((l) => emit(StudentFailure(errorMsg: l)), (r) {
        emit(StudentSuccess());
        add(GetStudentEvent());
      });
    });
  }
  @override
  void onChange(Change<StudentState> change) {
    log("$change");
    super.onChange(change);
  }
}
