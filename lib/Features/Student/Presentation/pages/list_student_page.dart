import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stu_management_sqllite/Features/Student/data/models/student_model.dart';
import 'package:stu_management_sqllite/core/widgets/custom_textform_field.dart';
import '../bloc/student_bloc.dart';
import '../widgets/student_card.dart';
import 'add_student_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchController = TextEditingController();
  List<StudentModel> _allStudents = [];
  List<StudentModel> _filteredStudents = [];

  @override
  void initState() {
    super.initState();
    context.read<StudentBloc>().add(GetStudentEvent());
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = searchController.text.trim().toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _filteredStudents = _allStudents;
      });
    } else {
      setState(() {
        _filteredStudents = _allStudents
            .where((student) => student.name.toLowerCase().contains(query))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Management")),
      body: BlocConsumer<StudentBloc, StudentState>(
        listener: (context, state) {
          if (state is StudentDeleteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Successfully deleted!')),
            );
          } else if (state is StudentDeleteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMsg)),
            );
          }
        },
        builder: (context, state) {
          if (state is StudentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StudentFailure) {
            return Center(child: Text("Error: ${state.errorMsg}"));
          } else if (state is StudentFetchSuccess) {
            _allStudents = state.studentModels;
            _filteredStudents = searchController.text.isEmpty
                ? _allStudents
                : _allStudents
                    .where((student) => student.name
                        .toLowerCase()
                        .contains(searchController.text.trim().toLowerCase()))
                    .toList();

            return Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: customTextField(
                      "Search by name",
                      searchController,
                      (_) => null,
                      context,
                      TextInputType.name, onChanged: (val) {
                    _allStudents
                        .where((student) => student.name.toLowerCase().contains(
                            searchController.text.trim().toLowerCase()))
                        .toList();
                    setState(() {});
                  }),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: _filteredStudents.isEmpty
                      ? const Center(child: Text('No students found'))
                      : ListView.builder(
                          itemCount: _filteredStudents.length,
                          itemBuilder: (context, index) {
                            final StudentModel student =
                                _filteredStudents[index];
                            return studentCard(
                                sno: "${index + 1}.",
                                student: student,
                                context: context);
                          },
                        ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddStudentPage())),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
