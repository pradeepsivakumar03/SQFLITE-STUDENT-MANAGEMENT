import 'package:flutter/material.dart';

Widget customDropDown(
    String hintText,
    List<String> items,
    BuildContext context,
    String? Function(String?)? validator,
    Function(String?)? onChanged,
    String? value) {
  return DropdownButtonFormField(
    style: Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
    isExpanded: true,
    decoration: InputDecoration(
      labelText: hintText,
      labelStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black54),
      ),
    ),
    value: value,
    items: items
        .map((String item) => DropdownMenuItem(value: item, child: Text(item)))
        .toList(),
    onChanged: onChanged,
    validator: validator,
  );
}
