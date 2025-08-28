import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';

import '../bloc/student_bloc.dart';

void showDeleteConfirmationDialog(
    BuildContext context, StudentModel studentModel) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Delete Student",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        content: const Text("Are you sure you want to delete this student?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).pop();
              context.read<StudentBloc>().add(
                    DeleteStudentEvent(
                      studentModel: studentModel,
                    ),
                  );
            },
            child: const Text(
              "Delete",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
