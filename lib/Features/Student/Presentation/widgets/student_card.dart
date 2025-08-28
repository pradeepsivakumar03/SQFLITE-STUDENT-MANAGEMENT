import 'package:flutter/material.dart';
import '../../data/models/student_model.dart';
import '../pages/edit_student_page.dart';
import 'custom_icon_btn.dart';
import 'details_widget.dart';
import 'show_delete_dialog.dart';

Widget studentCard({
  required String sno,
  required StudentModel student,
  required BuildContext context,
}) {
  return ExpansionTile(
    leading: Text(
      sno,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17.5,
        fontWeight: FontWeight.bold,
      ),
    ),
    title: Text(
      student.name,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17.5,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: Text(student.rollno),
    childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    trailing: SizedBox(
      width: 90,
      child: Row(
        children: [
          iconBtnWidget(
            iconData: Icons.edit,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditStudentPage(
                          studentModel: student,
                        ))),
          ),
          const SizedBox(width: 8.0),
          iconBtnWidget(
            iconData: Icons.delete,
            onTap: () => showDeleteConfirmationDialog(context, student),
          ),
        ],
      ),
    ),
    children: [
      userDetailsCard(
          "Class", "${student.curClass} - ${student.section}", context,
          width1: MediaQuery.sizeOf(context).width * 0.58),
      userDetailsCard("Blood Group", student.bloodGroup, context,
          width1: MediaQuery.sizeOf(context).width * 0.58),
      userDetailsCard("Parent Pno", student.parentPhno, context,
          width1: MediaQuery.sizeOf(context).width * 0.58),
      userDetailsCard("Address", student.address, context,
          width1: MediaQuery.sizeOf(context).width * 0.58),
    ],
  );
}
