import 'package:flutter/material.dart';

Widget customButton(String text, Function() onPressed, BuildContext context,
    {bool? isLoading}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
      backgroundColor: const Color.fromRGBO(31, 70, 129, 1),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isLoading == true) ...[
          Transform.scale(
            scale: 0.4,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
        ],
        Text(
          text.toUpperCase(),
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
