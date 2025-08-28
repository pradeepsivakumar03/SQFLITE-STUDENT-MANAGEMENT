import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stu_management_sqllite/Features/Student/Presentation/bloc/student_bloc.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/core/widgets/custom_textform_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_drop_down_field.dart';

class EditStudentPage extends StatefulWidget {
  final StudentModel studentModel;
  const EditStudentPage({
    super.key,
    required this.studentModel,
  });

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final nameController = TextEditingController();
  final rollnoController = TextEditingController();
  final addressController = TextEditingController();
  final parentPhnoController = TextEditingController();

  String? selectedClass;
  String? selectedSection;
  String? selectedBloodGroup;

  final List<String> classes = [
    'Pre-KG',
    'LKG',
    'UKG',
    '1st Std',
    '2nd Std',
    '3rd Std',
    '4th Std',
    '5th Std',
    '6th Std',
    '7th Std',
    '8th Std',
    '9th Std',
    '10th Std',
    '11th Std (+1)',
    '12th Std (+2)',
  ];

  final List<String> sections = ['A', 'B', 'C', 'D'];
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  @override
  void initState() {
    nameController.text = widget.studentModel.name;
    rollnoController.text = widget.studentModel.rollno;
    selectedClass = widget.studentModel.curClass;
    selectedSection = widget.studentModel.section;
    selectedBloodGroup = widget.studentModel.bloodGroup;
    addressController.text = widget.studentModel.address;
    parentPhnoController.text = widget.studentModel.parentPhno;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    rollnoController.dispose();
    addressController.dispose();
    parentPhnoController.dispose();
    super.dispose();
  }

  Future<void> _editStudent() async {
    if (_formKey.currentState!.validate()) {
      final student = StudentModel(
        id: widget.studentModel.id,
        name: nameController.text.trim(),
        rollno: rollnoController.text.trim(),
        curClass: selectedClass ?? '',
        section: selectedSection ?? '',
        bloodGroup: selectedBloodGroup ?? '',
        address: addressController.text.trim(),
        parentPhno: parentPhnoController.text.trim(),
      );
      context
          .read<StudentBloc>()
          .add(UpdateStudentEvent(studentModel: student));
    }
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? _validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a value';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Student")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<StudentBloc, StudentState>(
          listener: (context, state) {
            if (state is StudentLoading) {
              setState(() => isLoading = true);
            } else if (state is StudentFailure) {
              setState(() => isLoading = false);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMsg.errorMsg)),
              );
            } else if (state is StudentSuccess) {
              setState(() => isLoading = false);
              nameController.clear();
              rollnoController.clear();
              addressController.clear();
              parentPhnoController.clear();
              selectedClass = null;
              selectedSection = null;
              selectedBloodGroup = null;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Student updated successfully!')),
              );
            }
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  customTextField("Name", nameController, _validateNotEmpty,
                      context, TextInputType.text),
                  const SizedBox(height: 12),
                  customTextField("Roll No", rollnoController,
                      _validateNotEmpty, context, TextInputType.text),
                  const SizedBox(height: 12),
                  customDropDown(
                    "Select Class",
                    classes,
                    context,
                    _validateDropdown,
                    (value) {
                      setState(() {
                        selectedClass = value;
                      });
                    },
                    selectedClass,
                  ),
                  const SizedBox(height: 12),
                  customDropDown(
                    "Select Section",
                    sections,
                    context,
                    _validateDropdown,
                    (value) {
                      setState(() {
                        selectedSection = value;
                      });
                    },
                    selectedSection,
                  ),
                  const SizedBox(height: 12),
                  customDropDown(
                    "Select Blood Group",
                    bloodGroups,
                    context,
                    _validateDropdown,
                    (value) {
                      setState(() {
                        selectedBloodGroup = value;
                      });
                    },
                    selectedBloodGroup,
                  ),
                  const SizedBox(height: 12),
                  customTextField("Address", addressController,
                      _validateNotEmpty, context, TextInputType.multiline),
                  const SizedBox(height: 12),
                  customTextField("Parent Phone No", parentPhnoController,
                      _validateNotEmpty, context, TextInputType.phone),
                  const SizedBox(height: 20),
                  customButton("Update", _editStudent, context,
                      isLoading: isLoading),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
