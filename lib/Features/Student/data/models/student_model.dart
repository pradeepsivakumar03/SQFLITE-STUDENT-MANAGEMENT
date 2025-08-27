import 'package:stu_management_sqllite/Features/Student/domain/entity/student.dart';

class StudentModel extends Student {
  const StudentModel({
    required super.name,
    required super.rollno,
    required super.curClass,
    required super.section,
    required super.bloodGroup,
    required super.address,
    required super.parentPhno,
  });

  factory StudentModel.fromJson(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'] as String,
      rollno: map['rollno'] as String,
      curClass: map['curClass'] as String,
      section: map['section'] as String,
      bloodGroup: map['bloodGroup'] as String,
      address: map['address'] as String,
      parentPhno: map['parentPhno'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'rollno': rollno,
      'curClass': curClass,
      'section': section,
      'bloodGroup': bloodGroup,
      'address': address,
      'parentPhno': parentPhno,
    };
  }

  Student copyWith({
    String? name,
    String? rollno,
    String? curClass,
    String? section,
    String? bloodGroup,
    String? address,
    String? parentPhno,
  }) {
    return Student(
      name: name ?? this.name,
      rollno: rollno ?? this.rollno,
      curClass: curClass ?? this.curClass,
      section: section ?? this.section,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      address: address ?? this.address,
      parentPhno: parentPhno ?? this.parentPhno,
    );
  }

  @override
  String toString() {
    return 'Student(name: $name, rollno: $rollno, curClass: $curClass, section: $section, bloodGroup: $bloodGroup, address: $address, parentPhno: $parentPhno)';
  }
}
