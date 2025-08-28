import 'package:flutter/material.dart';

Widget iconBtnWidget({required IconData iconData, required Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration:
          BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
      child: Icon(
        iconData,
        color: Colors.black,
      ),
    ),
  );
}
