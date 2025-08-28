import 'package:flutter/material.dart';

Widget customTextField(
  String hintText,
  TextEditingController controller,
  String? Function(String?)? validator,
  BuildContext context,
  TextInputType? keyboardType, {
  Function(String)? onChanged,
  int? maxLines,
}) {
  return TextFormField(
    style: Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    maxLines: maxLines,
    minLines: 1,
    decoration: InputDecoration(
      labelText: hintText,
      labelStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onChanged: onChanged,
  );
}
