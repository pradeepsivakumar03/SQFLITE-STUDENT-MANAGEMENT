import 'package:flutter/foundation.dart' show immutable;

@immutable
class Student {
  final int? id;
  final String name;
  final String rollno;
  final String curClass;
  final String section;
  final String bloodGroup;
  final String address;
  final String parentPhno;

  const Student(
      {this.id,
      required this.name,
      required this.rollno,
      required this.curClass,
      required this.section,
      required this.bloodGroup,
      required this.address,
      required this.parentPhno});
}
